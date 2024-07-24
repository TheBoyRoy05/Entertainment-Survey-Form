#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=games -t --no-align -c"

NUMBER=$(($RANDOM % 1000 + 1))
GUESSES=1

echo "Enter your username:"
read USERNAME
NUM_GAMES=$($PSQL "SELECT COUNT(*) FROM games WHERE username = '$USERNAME'")
BEST_SCORE=$($PSQL "SELECT MIN(num_guesses) FROM games WHERE username = '$USERNAME'")

if [[ $NUM_GAMES = 0 ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $NUM_GAMES games, and your best game took $BEST_SCORE guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS
while [[ ! $GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESS
done

while [[ $GUESS != $NUMBER ]]
do
  if [[ $GUESS -gt $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  read GUESS
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS
  done
  GUESSES=$(($GUESSES + 1))
done

echo "You guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!"
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(username, num_guesses) VALUES('$USERNAME', $GUESSES)")
