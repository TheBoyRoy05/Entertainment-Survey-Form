#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

INPUT=$1

if [[ $INPUT ]]
then
  if [[ $INPUT =~ ^[0-9]+$ ]]
  then
    ELEMENT_INFO=$($PSQL "
      SELECT * 
      FROM elements 
      JOIN properties USING(atomic_number) 
      JOIN types USING(type_id) 
      WHERE atomic_number = $INPUT
    ")
  else
    ELEMENT_INFO=$($PSQL "
      SELECT * 
      FROM elements 
      JOIN properties USING(atomic_number) 
      JOIN types USING(type_id) 
      WHERE symbol = '$INPUT' OR name = '$INPUT'
    ")
  fi

  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else
    echo $ELEMENT_INFO | sed 's/|/ /g' | while read TYPE_ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
    do
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). \
It's a $TYPE, with a mass of $MASS amu. \
$NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
else
  echo -e "Please provide an element as an argument."
fi
