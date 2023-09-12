# batch_watermark
Batch Watermarking with ImageMagick

You need to have the following installed:
- bash
- ImageMagick
- bc

By default the watermark defaults to 15% of the size of the image being watermarked. It will not be resized if 
the resized width is greater than its original width. 

Make sure that you have a file called `watermark.png` in the folder with your pictures. 

To change the relative size of the watermark replace 6.66 in the below code with the value of 1/0.(% size you want).

```bash
    imgx=$( echo "scale=0; $(identify -format "%w" $pic)/6.66" | bc)
    imgy=$( echo "scale=0; $(identify -format "%h" $pic)/6.66" | bc)
```
