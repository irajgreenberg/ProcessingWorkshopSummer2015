/*
 * A GrayscaleFilter averages the values of red, green, and blue
 * and creates a new color using the average as the value for all
 * three channels
 */
class GrayscaleFilter implements PixelFilter
{
    color convert(color inColor)
    {
        float r = red(inColor);
        float g = green(inColor);
        float b = blue(inColor);
        
        return color( (r + g + b) / 3 );
    }
}

/*
 * A NegativeFilter finds the opposite value for the red, green,
 * and blue channels in the pixel
 */
class NegativeFilter implements PixelFilter
{
    color convert(color inColor)
    {
        float r = red(inColor);
        float g = green(inColor);
        float b = blue(inColor);
        
        return color( 255 - r, 255 - g, 255 - b );
    }
}

/*
 * A TintFilter multiplies the red, green, and blue channels
 * by a multiplier
 */
class TintFilter implements PixelFilter
{
    float redTint, greenTint, blueTint;
    
    TintFilter(float redTint, float greenTint, float blueTint)
    {
        this.redTint = redTint;
        this.greenTint = greenTint;
        this.blueTint = blueTint;
    }
    
    color convert(color inColor)
    {
        float r = red(inColor);
        float g = green(inColor);
        float b = blue(inColor);
        
        return color( min(r * redTint, 255), min(g * greenTint, 255), min(b * blueTint, 255) );
    }
}
