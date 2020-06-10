#!/bin/bash -x

echo "Welcome to Snakes And Ladders"

START_POSITION=0
dieValue=$(( RANDOM%6 + 1 ))
echo $dieValue
