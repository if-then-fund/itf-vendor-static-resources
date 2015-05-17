#!/bin/bash
webfont-dl \
	"http://fonts.googleapis.com/css?family=`cat fonts.txt | python3 fonts.py`" \
	-o static/fonts/fonts.css
