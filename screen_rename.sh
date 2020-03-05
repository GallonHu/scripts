#!/bin/sh

fswatch -0 $HOME/Documents/screenshot/ | while read -d "" event; do
	python3 $HOME/scripts/rename.py "${event}"
	# echo ${event}
done &
