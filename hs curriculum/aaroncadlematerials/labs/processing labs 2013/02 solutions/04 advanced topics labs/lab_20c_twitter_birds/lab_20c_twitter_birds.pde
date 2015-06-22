/**
 * Visualize tweets about you as a floxk of birds
 *
 * @author Stephen C. Fornal
 * @author http://mrfornal.net
 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.
 */

//Min time between checks    (60sec / Tweets per minute) * 1000ms
final int TWEET_INTERVAL = (int)(60.0 / 5.5 * 1000);

ArrayList<Tweeter> birds;
int lastCheckTime;

void setup()
{
    size(1024, 768);
    smooth();
    textSize(12);
    imgBird = loadImage("bird.png");
    birds = new ArrayList<Tweeter>();
    connectTwitter();
    //getMentions(); //Uncomment this line to "start fresh"
    lastCheckTime = 0;
}

void draw()
{
	background(255);
    if (lastCheckTime == 0 || millis() - lastCheckTime > TWEET_INTERVAL)
    {
    	getMentions();
    	if (response != null && response.size() > 0)
	    {
	    	processTweets();             //Comment this line and...
	    	//processTweetsWithImage();  //Uncomment this line for more fun!
	    	response.clear();
	    }
	    lastCheckTime = millis();
    }
    
    
    for (Tweeter bird : birds)
    {
    	bird.update();
    	bird.render();
    }
}

void processTweetsWithImage()
{
	for (Status s : response)
	{
		String user = s.getUser().getScreenName();
		PImage img;
		Tweeter bird;
		try
		{
			img = loadImage(s.getUser().getProfileImageURL().toString());
			bird = new Tweeter(user, img);
		}
		catch (Exception e)
		{
			bird = new Tweeter(user);
		}
		birds.add(bird);
	}
}

void processTweets()
{
	for (Status s : response)
	{
		String user = s.getUser().getScreenName();
		Tweeter bird = new Tweeter(user);
		birds.add(bird);
	}
}

