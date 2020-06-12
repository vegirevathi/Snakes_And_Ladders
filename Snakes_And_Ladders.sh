#!/bin/bash

echo "Welcome to Snakes And Ladders"

START_POSITION=0
WINNING_POSITION=100

function playerOptions()
{
   playerPosition=$1
   noPlay=1
   ladder=2
   snake=3
   dieValue=$(( ($RANDOM%6)+1 ))
   option=$(( ($RANDOM%3) + 1 ))
   case $option in
   $noPlay)
      playerPosition=$playerPosition
      ;;
   $ladder)
      if [ $(( $playerPosition + $dieValue )) -gt $WINNING_POSITION ]
      then
         playerPosition=$playerPosition
      else
         playerPosition=$(( $playerPosition + $dieValue ))
      fi
      ;;
   $snake)
      if [ $(( $playerPosition - $dieValue)) -lt $START_POSITION ]
      then
         playerPosition=$START_POSITION
      else
         playerPosition=$(( $playerPosition - $dieValue ))
      fi
      ;;
   esac
   echo $playerPosition
}

function twoPlayers()
{
   playerOnePosition=$START_POSITION
   playerTwoPosition=$START_POSITION

   while [ $playerOnePosition -lt $WINNING_POSITION ] && [ $playerTwoPosition -lt $WINNING_POSITION ]
   do
      playerOnePosition=$(playerOptions $playerOnePosition)
      echo "Player One Position > " $playerOnePosition

      if [ $playerOnePosition -eq $WINNING_POSITION ]
      then
         echo "Player One Won The Game"
         break
      fi

      playerTwoPosition=$(playerOptions $playerTwoPosition)
      echo "Player Two Positon > " $playerTwoPosition
      echo "------------------------------------------------------------"

      if [ $playerTwoPosition -eq $WINNING_POSITION ]
      then
         echo "Player Two Won The Game"
      fi
      (( diceRolled++ ))
   done
}
twoPlayers
echo "Number of times dice rolled" $diceRolled
