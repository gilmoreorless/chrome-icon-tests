#!/bin/bash

if [[ $# < 2 ]]; then
	echo "Usage: $0 size_in_pixels filename"
	echo "  e.g. to create a 48x48 image:"
	echo ""
	echo "     $0 48 icon-48.png"
	echo ""
	exit 1
fi

sizefull=$1
(( sizehalf=$sizefull / 2 ))
(( sizefont=$sizefull / $((( $sizefull > 99 )) && echo 5 || echo 4) * 3 ))
(( stopfull=$sizefull - 1 ))
(( stophalf=$sizehalf - 1 ))

filename=$2

convert -size ${sizefull}x${sizefull} xc:red \
	-fill darkred \
	-draw "rectangle 0,0 $stophalf,$stophalf" \
	-draw "rectangle $sizehalf,$sizehalf $stopfull,$stopfull" \
	-fill none -stroke black \
	-draw "rectangle 0,0 $stopfull,$stopfull" \
	-fill white -stroke none \
	-font Impact -pointsize $sizefont -gravity center \
	-annotate +0+0 "$sizefull" \
	$filename
