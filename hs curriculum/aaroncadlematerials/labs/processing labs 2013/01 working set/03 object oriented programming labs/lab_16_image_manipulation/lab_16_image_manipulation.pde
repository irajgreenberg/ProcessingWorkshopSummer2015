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
    //This PImage method copies the color data into the pixels array
    img.loadPixels();

    //Now, traverse the pixels array, and swap the left-most pixels of each
    //row with the right-most pixels of the same row row, moving inward toward 
    //the midpoint of each row



    //This PImage method puts the modified color data in the pixels
    //array back into the image.
    img.updatePixels();
}

