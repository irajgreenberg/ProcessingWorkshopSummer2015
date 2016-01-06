
/*----------------------
Simple sketch showing incoming mentions
from the @SeguinLive timeline as they occur.

You must call connectTwitter() from the setup()
method to initialize the Twitter connection.

@author Stephen Fornal (http://mrfornal.net)
@version 1.0a

 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.

------------------------*/

ArrayList<TweetBall> tweets;
final int UPDATES_PER_MINUTE = 4;
final int FRAMES = (60 / UPDATES_PER_MINUTE) * 60;

void setup()
{
    size(1300, 750);
    connectTwitter();
    tweets = new ArrayList<TweetBall>();
    smooth();
    //sendTweet("This tweet sent from a Processing sketch! #test");
}

void draw()
{
    background(0);
    if (frameCount == 1 || frameCount % FRAMES == 0)
    {
        getMentions();
        
        for(Status s : response)
        {
            TweetBall t = new TweetBall(s.getUser().getScreenName(), s.getText());
            tweets.add(t);
        }
    }
    
    for (TweetBall t : tweets)
    {
        t.drawSelf();
    }
}
