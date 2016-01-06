/**
 * A ComboPixelFilter combines two filters
 * into one operation. It runs each pixel through
 * filter1, then runs the result of filter1 through
 * filter 2.
 */
class ComboPixelFilter implements PixelFilter
{
    PixelFilter filter1, filter2;
    
    ComboPixelFilter(PixelFilter f1, PixelFilter f2)
    {
        //Add necessary assignment statements
    }
    
    color convert(color inColor)
    {
        return 0;
    }
}


/**
 * A ComboImageFilter combines two filters
 * into one operation. It runs each image through
 * filter1, then runs the result of filter1 through
 * filter 2.
 */
class ComboImageFilter implements ImageFilter
{
    //Add necessary instance fields
    
    ComboImageFilter(ImageFilter f1, ImageFilter f2)
    {
        //Add assignment statements
    }
    
    void convert(PImage img)
    {
        //Add necessary code
    }
}
