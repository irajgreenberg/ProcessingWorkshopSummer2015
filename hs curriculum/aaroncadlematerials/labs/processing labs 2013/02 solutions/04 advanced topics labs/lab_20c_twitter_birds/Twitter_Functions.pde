//oAuth keys - these should not ever be public!
final String consumerKey = "";
final String consumerSecret = "";

//Access Keys for user account - also private!
final String accessToken = "";
final String accessTokenSecret = "";

//Twitter instance
Twitter twitter;
//Responses from queries
ResponseList<Status> response;
long lastMentionID = 0;

/**
 * This method sets the Twitter connection up
 */
void connectTwitter()
{
    twitter = new TwitterFactory().getInstance();
    twitter.setOAuthConsumer(consumerKey, consumerSecret);
    twitter.setOAuthAccessToken(new AccessToken(accessToken, accessTokenSecret));
    println("Authorization set");
}

/*
 * Sends a Tweet out as @SeguinLive
 */
void sendTweet(String t)
{
    try 
    {
        Status status = twitter.updateStatus(t);
        println("Successfully updated the status to [" + status.getText() + "].");
    } 
    catch(TwitterException e)
    { 
        println("Send tweet: " + e + " Status code: " + e.getStatusCode());
    }
}

/*
 * Get the most recent 20 mentions of @SeguinLive
 * since the last call to this method.
 * The responses are placed into the ResponseList.
 */
void getMentions()
{
    try
    {
        if (lastMentionID == 0)
        {
            response = twitter.getMentions();
        }
        else
        {
            Paging limit = new Paging(lastMentionID);
            response = twitter.getMentions(limit);
        }
    }
    catch(TwitterException e)
    {
        println("Get Mentions: " + e + " Status code: " + e.getStatusCode());
    }

    if (response != null && response.size() > 0)
    {
        println("Fetched " + response.size() + " mentions.");
        lastMentionID = response.get(0).getId();
    }
    else
    {
        println("No mentions fetched just now.");
    }
    if (response != null)
    {
        println("Responses left this hour: " + response.getRateLimitStatus().getRemainingHits());
    }
}

