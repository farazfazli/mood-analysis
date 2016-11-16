require("rtweet")
require("wordcloud")

twitter_token <- create_token(app = "APP_NAME_HERE",
                              consumer_key = "CONSUMER_KEY_HERE",
                              consumer_secret = "CONSUMER_SECRET_HERE")
tweets <- search_tweets("happy", n = 10000, token = twitter_token, lang = "en")

tweetsVector = unlist(tweets)
tweetFrequency = table(tweetsVector)
wordcloud(names(tweetFrequency), min.freq = 10, random.order = FALSE, colors = palette())