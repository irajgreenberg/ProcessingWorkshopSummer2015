/**
 * A PixelFilter is an object that can receive a color
 * value, and return a new color based on modifying the
 * original color. Each implementing class defines the
 * operations performed on the color.
 */
interface PixelFilter
{
    /**
     * This operation converts a color value
     *
     * @param inColor The color to be converted
     * @return A new color
     */
    color convert(color inColor);
}

/**
 * An ImageFilter is an object that can change an
 * image in some way. Each implementing class defines
 * its own rules for modifying the image.
 */
interface ImageFilter
{
    /**
     * This operation modifies the pixels in an
     * image in some way. The image passed as a
     * parameter is actually changed.
     *
     * @param img The image to modify
     */
    void convert(PImage img);
}
