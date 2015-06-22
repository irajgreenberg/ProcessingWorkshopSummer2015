/*
 * A GrayscaleFilter averages the values of red, green, and blue
 * and creates a new color using the average as the value for all
 * three channels
 */
class GrayscaleFilter implements PixelFilter
{
    color convert(color inColor)
    {
        return 0;
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
        return 0;
    }
}

/*
 * A TintFilter multiplies the red, green, and blue channels
 * by a multiplier
 */
class TintFilter implements PixelFilter
{
    //Add instance fields
    
    TintFilter(float redTint, float greenTint, float blueTint)
    {
        //Add code to assign instance fields
    }
    
    color convert(color inColor)
    {
        return 0;
    }
}
