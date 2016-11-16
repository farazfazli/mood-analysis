require("rtweet")
require("wordcloud")

twitter_token <- create_token(app = "APP_NAME",
                              consumer_key = "CONSUMER_KEY",
                              consumer_secret = "CONSUMER_SECRET")

happy <- search_tweets("happy", n = 10000, token = twitter_token, lang = "en")
sad <- search_tweets("sad", n = 10000, token = twitter_token, lang = "en")

generateCloud<-function(tweets) {
  tweetsVector = unlist(tweets)
  tweetFrequency = table(tweetsVector)
  wordcloud(names(tweetFrequency), min.freq = 10, random.order = FALSE, colors = palette())
}

png("happy.png", width=12, height=8, units="in", res=600)
generateCloud(happy)
dev.off()
png("sad.png", width=12, height=8, units="in", res=600)
generateCloud(sad)
dev.off()
