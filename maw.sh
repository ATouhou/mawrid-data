#!/bin/bash
PDF=source/alMawrid.pdf
BASE=source/maw/
OUTPUT=img/maw/
#for i in {100..1866}; do 
for i in {0..7}; do  #1257
	div=$((i/100))	
	mkdir -p $OUTPUT/$div $BASE/$div
	#for j in $BASE/$i/*pbm; do
	#convert -verbose -density 300 "${PDF}[$i]" $BASE/$div/maw-$i.png
	#scantailor-cli -v --dpi=300 --output-dpi=300 \
	#	--layout=1 \
	#	$BASE/$div/maw-$i.png $BASE/$div/
	convert -verbose $BASE/$div/maw-$i.tif -trim -resize 900 -colors 4 \
		"$OUTPUT/$div/maw-$(printf %04d $i).png"
done
