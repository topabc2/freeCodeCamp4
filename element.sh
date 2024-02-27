#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
# ******************************************************************************************
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  QUERY_RESULT_1=$($PSQL "SELECT * FROM properties WHERE atomic_number = $1")
  if [[ $QUERY_RESULT_1 ]]
  then
    echo "$QUERY_RESULT_1" | while read ATOMIC_NUMBER BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID
    do
      QUERY_RESULT_2=$($PSQL "SELECT * FROM types WHERE type_id = $TYPE_ID")
      echo "$QUERY_RESULT_2" | while read TYPE_ID BAR TYPE
      do
        QUERY_RESULT_3=$($PSQL "SELECT * FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
        echo "$QUERY_RESULT_3" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
      done
    done
  fi

  QUERY_RESULT_4=$($PSQL "SELECT * FROM elements WHERE symbol = '$1'")
  if [[ $QUERY_RESULT_4 ]]
  then
    echo "$QUERY_RESULT_4" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME
    do
      QUERY_RESULT_5=$($PSQL "SELECT * FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
      echo "$QUERY_RESULT_5" | while read ATOMIC_NUMBER BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID
      do
        QUERY_RESULT_6=$($PSQL "SELECT * FROM types WHERE type_id = $TYPE_ID")
        echo "$QUERY_RESULT_6" | while read TYPE_ID BAR TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
      done
    done
  fi

  QUERY_RESULT_7=$($PSQL "SELECT * FROM elements WHERE name = '$1'")
  if [[ $QUERY_RESULT_7 ]]
  then
    echo "$QUERY_RESULT_7" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME
    do
      QUERY_RESULT_8=$($PSQL "SELECT * FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
      echo "$QUERY_RESULT_8" | while read ATOMIC_NUMBER BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID
      do
        QUERY_RESULT_9=$($PSQL "SELECT * FROM types WHERE type_id = $TYPE_ID")
        echo "$QUERY_RESULT_9" | while read TYPE_ID BAR TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
      done
    done
  fi

  if [ -z $QUERY_RESULT_1 ] && [ -z $QUERY_RESULT_4 ] && [ -z $QUERY_RESULT_7 ]
  then
    echo "I could not find that element in the database."
  fi
fi