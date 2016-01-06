/**
 * An HFlipFilter processes an image by rotating it around
 * the y-axis.
 */
class HFlipFilter implements ImageFilter
{
    void convert(PImage img)
    {
        img.loadPixels();
        
        //Add code to flip the image horizontally
        
        img.updatePixels();
    }
}

/**
 * A VFlipFilter processes and image by rotating
 * it around the x-axis
 */
class VFlipFilter implements ImageFilter
{
    void convert(PImage img)
    {
        img.loadPixels();
        
        //Add code to flip the image vertically
        
        img.updatePixels();
    }
}

