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
        filter1 = f1;
        filter2 = f2;
    }
    
    color convert(color inColor)
    {
        return filter2.convert( filter1.convert(inColor) );
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
    ImageFilter filter1, filter2;
    
    ComboImageFilter(ImageFilter f1, ImageFilter f2)
    {
        filter1 = f1;
        filter2 = f2;
    }
    
    void convert(PImage img)
    {
        filter1.convert(img);
        filter2.convert(img);
    }
}
