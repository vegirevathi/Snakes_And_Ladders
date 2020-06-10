#!/bin/bash

echo "Welcome to Snakes And Ladders"

START_POSITION=0
declare -A diceDictionary

function checkOptions()
{
	playerPosition=$START_POSITION	
	noPlay=1
	ladder=2
	snake=3
	while [ $playerPosition -lt 100 ]
	do
		(( diceRollCount++ ))
		diceDictionary[ $diceRollCount ]=$playerPosition

		dieValue=$(( RANDOM%6 + 1 ))
		option=$(( RANDOM%3 + 1 ))
		case $option in
		$noPlay)
			playerPosition=$playerPosition
			;;
		$ladder)
			if [ $(( $playerPosition + $dieValue )) -gt 100 ]
			then
				playerPosition=$playerPosition
			else
				playerPosition=$(( $playerPosition + $dieValue ))
			fi
			;;
		$snake)
			if [ $(( $playerPosition - $dieValue)) -le $START_POSITION ]
      	then
         	playerPosition=$START_POSITION
			else
				playerPosition=$(( $playerPosition - $dieValue ))
			fi
			;;
		esac
	echo "dice value" $dieValue
	echo "player option" $option
	echo "playerPosition " $playerPosition
	echo "------------------------------------------------------------"
	done
	echo "Won the game"
	echo "Dice total rolls : $diceRollCount"
	echo "${diceDictionary[@]}"
}
checkOptions

