#!/bin/bash

mkdir -p Marked

for pic in *.{png,jpg}; do 

    # Get the image width
    imgx=$( echo "scale=0; $(identify -format "%w" $pic)/6.66" | bc)
    imgy=$( echo "scale=0; $(identify -format "%h" $pic)/6.66" | bc)

    if [ "$imgx" -lt $(identify -format "%w" watermark.png) ]; then
        convert watermark.png -resize "$imgx"x"$imgy" tempMark.png
        composite -dissolve 90% -gravity southwest -geometry "+10+10" tempMark.png $pic Marked/$pic
        rm tempMark.png
    else
        composite -dissolve 90% -gravity southwest -geometry "+10+10" watermark.png $pic Marked/$pic
    fi
        

done
