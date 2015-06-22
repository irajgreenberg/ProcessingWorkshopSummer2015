/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Image Manipulation
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

PImage image1;
PImage image2;

void setup()
{
    //Set the size to your images (width * 2) + 1
    //and the height to your images height
    size(401, 200);
    
    image1 = loadImage(DATA_FILE_NAME);
    image2 = loadImage(DATA_FILE_NAME);
    
    noLoop();
}

void draw()
{
    process(image2);
    //labExtension(image2); //Uncomment for extension (v-flip)
    
    image(image1, 0, 0);    
    image(image2, width / 2 + 1, 0);

    //The rest of this code just puts a nice
    //label on the bottom of the pictures
    stroke(255);
    fill(255);
    line(width / 2, 0, width / 2, height);
    text("Original", 10, height - 10);
    textAlign(RIGHT);
    text("Modified", width - 10, height - 10);
}

void process(PImage img)
{
    img.loadPixels();

    for (int x = 0; x < img.width / 2; x++)
    {
        for (int y = 0; y < img.height; y++)
        {
            int current = y * img.width + x;

            int mirror = y * img.width + (img.width - x - 1);

            color temp = img.pixels[current];
            img.pixels[current] = img.pixels[mirror];
            img.pixels[mirror] = temp;
        }
    } 
    
    img.updatePixels();
}

//Solution to Extension for Lab 16
void labExtension(PImage img)
{
    img.loadPixels();
    
    for (int x = 0; x < img.width; x++)
    {
        for (int y = 0; y < img.height / 2; y++)
        {
            int current = y * img.width + x;

            int mirror = (img.height - y - 1) * img.width + x;

            color temp = img.pixels[current];
            img.pixels[current] = img.pixels[mirror];
            img.pixels[mirror] = temp;
        }
    }
    
    img.updatePixels();
}

