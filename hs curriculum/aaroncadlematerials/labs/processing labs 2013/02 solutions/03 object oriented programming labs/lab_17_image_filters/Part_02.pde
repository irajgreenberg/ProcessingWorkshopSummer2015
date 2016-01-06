/**
 * An HFlipFilter processes an image by rotating it around
 * the y-axis.
 */
class HFlipFilter implements ImageFilter
{
    void convert(PImage img)
    {
        img.loadPixels();
        for (int x = 0; x < img.width / 2; x++)
        {
            for (int y = 0; y < img.height; y++)
            {
                int spot = y * img.width + x;

                int endSpot = y * img.width + (img.width - x - 1);

                color temp = img.pixels[spot];
                img.pixels[spot] = img.pixels[endSpot];
                img.pixels[endSpot] = temp;
            }
        }
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
        for (int x = 0; x < img.width; x++)
        {
            for (int y = 0; y < img.height / 2; y++)
            {
                int spot = y * img.width + x;

                int endSpot = (img.width - y - 1) * img.width + x;

                color temp = img.pixels[spot];
                img.pixels[spot] = img.pixels[endSpot];
                img.pixels[endSpot] = temp;
            }
        }
        img.updatePixels();
    }
}

