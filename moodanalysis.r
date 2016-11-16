require("rtweet")
require("wordcloud")

twitter_token <- create_token(app = "APP_NAME_HERE",
                              consumer_key = "CONSUMER_KEY_HERE",
                              consumer_secret = "CONSUMER_SECRET_HERE")

happy <- search_tweets("happy", n = 10000, token = twitter_token, lang = "en")
sad <- search_tweets("sad", n = 10000, token = twitter_token, lang = "en")

generateCloud(happy)
generateCloud(sad)

generateCloud<-function(tweets) {
  tweetsVector = unlist(tweets)
  tweetFrequency = table(tweetsVector)
  wordcloud(names(tweetFrequency), min.freq = 10, random.order = FALSE, colors = palette())
}