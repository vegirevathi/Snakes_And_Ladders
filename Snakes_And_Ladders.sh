#!/bin/bash -x

echo "Welcome to Snakes And Ladders"

START_POSITION=0

function checkOptions()
{
	playerPosition=$START_POSITION	
	noPlay=1
	ladder=2
	snake=3
	while [ $playerPosition -lt 100 ]
	do
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
	done
	echo "dice value" $dieValue
	echo "playerPosition " $playerPosition
	echo "Won the game"
}
checkOptions


