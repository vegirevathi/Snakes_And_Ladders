#!/bin/bash -x

echo "Welcome to Snakes And Ladders"

START_POSITION=0
dieValue=$(( RANDOM%6 + 1 ))
echo $dieValue

function checkOptions()
{
	option=$(( RANDOM%3 + 1 ))
	playerPosition=$START_POSITION	
	noPlay=1
	ladder=2
	snake=3
	case $option in
	$noPlay)
		playerPosition=$playerPosition
		;;
	$ladder)
		playerPosition=$(( $playerPosition + $dieValue ))
		;;
	$snake)
		playerPosition=$(( $playerPosition - $dieValue ))
		;;
	esac
	echo "playerPosition " $playerPosition
}
checkOptions
