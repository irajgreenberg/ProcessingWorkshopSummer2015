PImage img;

void setup()     
{      
  img = loadImage("warriorlogo3.gif");
  size(img.width,img.height);
}

void draw() 
{
  image(img, 0, 0);
}

void mouseClicked()
{
    img.loadPixels();
    for(int i=0;i<img.pixels.length; i++)
    {
        color c= img.pixels[i];
        // make three containers to store the red, green, and blue
        //values from the color variable called c
        
        //make a fourth container called avg
        //to remember the average, set this container to
        //the result return when you call your average method.
        
        
        
        img.pixels[i] = color(avg,avg,avg);
    }
    img.updatePixels();
}

//write the  average method HERE

