/*
 * A BasicImageFilter uses a "plugged in"
 * PixelFilter to process all the pixels in
 * a given array of colors.
 */
class BasicImageFilter implements ImageFilter
{
    PixelFilter pixelWorker;
    
    BasicImageFilter(PixelFilter pf)
    {
        this.pixelWorker = pf;
    }
    
    void convert(PImage img)
    {
        img.loadPixels();
        for (int i = 0; i < img.pixels.length; i++)
        {
            img.pixels[i] = pixelWorker.convert(img.pixels[i]);
        }
        img.updatePixels();
    }    
}

/*
 * A PassThroughFilter is a PixelFilter implementation that
 * simply returns the original color every time.
 */
class PassThroughFilter implements PixelFilter
{
    color convert(color inColor)
    {
        return inColor;
    }
}
