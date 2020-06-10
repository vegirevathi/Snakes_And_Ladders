#!/bin/bash -x

echo "Welcome to Snakes And Ladders"

START_POSITION=0
dieValue=$(( RANDOM%6 + 1 ))
echo $dieValue

function checkOptions()
{
	playerPosition=$START_POSITION	
	noPlay=1
	ladder=2
	snake=3
	while [ $playerPosition -le 100 ]
	do
		option=$(( RANDOM%3 + 1 ))
		case $option in
		$noPlay)
			playerPosition=$playerPosition
			;;
		$ladder)
			playerPosition=$(( $playerPosition + $dieValue ))
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
	echo "playerPosition " $playerPosition
}
checkOptions


