#!/bin/bash
PDF=source/alMawrid.pdf
BASE=source/lqn/
OUTPUT=img/lqn/
#for i in {100..1866}; do 
for i in {0..2161}; do  #2161
	div=$((i/100))	
	mkdir -p $OUTPUT/$div $BASE/$div
	#for j in $BASE/$i/*pbm; do
	#convert -verbose -density 300 "${PDF}[$i]" $BASE/$div/maw-$i.png
	scantailor-cli -v --dpi=150 --output-dpi=150 \
		--layout=1 \
		--color-mode=color_grayscale \
		$BASE/lqn-$(printf %04d $i).jpg $BASE/$div/
	convert -verbose $BASE/$div/lqn-$(printf %04d $i).tif -trim -resize 900 -colors 4 \
		"$OUTPUT/$div/lqn-$(printf %04d $i).png"
done
