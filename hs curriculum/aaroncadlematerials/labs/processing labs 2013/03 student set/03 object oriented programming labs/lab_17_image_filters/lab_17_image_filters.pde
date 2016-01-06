/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Image Filters
 *
 * @author Stephen C. Fornal
 * @author http://mrfornal.net
 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.
 *
 */

//Set your image files name here, and be sure to put
//it into the data folder!
final String DATA_FILE_NAME = "sample.png";
final String INSTRUCTIONS = "Press 1 - 9 to change filters";
String filterName;

PImage image1;
PImage image2;

ImageFilter imgFilter;

boolean isFiltered;

void setup()
{
    //Set the size to your images (width * 2) + 1
    //and the height to your images height
    size(401, 200);
    
    image1 = loadImage(DATA_FILE_NAME);
    image2 = loadImage(DATA_FILE_NAME);
    
    isFiltered = true;
    filterName = "Unfiltered";
}

void draw()
{
    if (!isFiltered)
    {
        image2 = loadImage(DATA_FILE_NAME);
        imgFilter.convert(image2);
        isFiltered = true;
    }
    
    image(image1, 0, 0);    
    image(image2, width / 2 + 1, 0);

    //The rest of this code just puts a nice
    //label on the bottom of the pictures
    stroke(255);
    fill(255);
    line(width / 2, 0, width / 2, height);
    textAlign(LEFT);
    text(INSTRUCTIONS, 10, 15);
    text("Original", 10, height - 10);
    textAlign(RIGHT);
    text(filterName, width - 10, height - 10);
}

void keyReleased()
{
    if (key == '1')
    {
        imgFilter = new BasicImageFilter(new PassThroughFilter());
        filterName = "PassThrough";
    }
    else if (key == '2')
    {
        imgFilter = new BasicImageFilter(new GrayscaleFilter());
        filterName = "Grayscale";
    }
    else if (key == '3')
    {
        imgFilter = new BasicImageFilter(new NegativeFilter());
        filterName = "Negative";
    }
    else if (key == '4')
    {
        imgFilter = new BasicImageFilter(new TintFilter(1.0, 0.5, 0.5));
        filterName = "Tint(r=1.0, g=0.5, b=0.5)";
    }
    else if (key == '5')
    {
        imgFilter = new BasicImageFilter(new TintFilter(0.0, 1.0, 0.0));
        filterName = "Tint(r=0.0, g=1.0, b=0.0)";
    }
    else if (key == '6')
    {
        imgFilter = new HFlipFilter();
        filterName = "HFlip";
    }
    else if (key == '7')
    {
        imgFilter = new VFlipFilter();
        filterName = "VFlip";
    }
    else if (key == '8')
    {
        imgFilter = new ComboImageFilter(new HFlipFilter(), new VFlipFilter());
        filterName = "HFlip + VFlip";
    }
    else if (key == '9')
    {
        imgFilter = new BasicImageFilter(new ComboPixelFilter(new NegativeFilter(), new GrayscaleFilter()));
        filterName = "Negative + Grayscale";
    }
    else if (key == '0')
    {
        ImageFilter f1 = new BasicImageFilter(new ComboPixelFilter(new NegativeFilter(), new GrayscaleFilter()));
        ImageFilter f2 = new ComboImageFilter(new HFlipFilter(), new VFlipFilter());
        
        imgFilter = new ComboImageFilter(f1, f2);
        filterName = "HFlip + VFlip + Negative + Grayscale";
    }
    isFiltered = false;
}
