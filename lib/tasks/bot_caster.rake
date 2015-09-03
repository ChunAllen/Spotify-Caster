namespace :tweet do

  CLIENT = TwitterApi.new

  desc "Tweets a random song from your followed artists"
  task random_song: :environment do
    composed_tweet = SpotifyApi.new(CLIENT.followed_artist).composed_hourly_tweet
    CLIENT.post(composed_tweet)
  end

  desc "Replies requested songs to unreplied mentions"
  task request: :environment do
    CLIENT.save_mentions
    CLIENT.reply_unreplied_mentions
  end

end

