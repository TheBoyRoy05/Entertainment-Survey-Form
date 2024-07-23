#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")

# Function to insert teams if they do not exist and return the team ID
function INSERT_TEAM() {
  TEAM_NAME="$1"

  # Get team ID if it exists
  ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")

  # If team does not exist, insert it
  if [[ -z $ID ]]; then
    INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME')")

    if [[ $INSERT_RESULT = "INSERT 0 1" ]]; then
      echo "Inserted $TEAM_NAME into teams" >&2
    fi

    # Get the new team ID after insertion
    ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")
  fi

  # Return the team ID (ensure this is the only output from this function)
  echo "$ID"
}

# Read the CSV and insert records into the database
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip header
  if [[ $YEAR = "year" ]]
  then
    continue
  fi

  # Get winner and opponent IDs
  WINNER_ID=$(INSERT_TEAM "$WINNER")
  OPPONENT_ID=$(INSERT_TEAM "$OPPONENT")

  # Insert game record into games table
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

  if [[ $INSERT_GAME_RESULT = "INSERT 0 1" ]]; then
    echo "Inserted game: $WINNER vs $OPPONENT ($YEAR, $ROUND)"
  fi
done