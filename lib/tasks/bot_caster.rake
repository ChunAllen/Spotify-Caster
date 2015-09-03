namespace :tweet do

  desc "Tweets a random song from your followed artists"
  task random_song: :environment do
    client = TwitterApi.new
    composed_tweet = SpotifyApi.new({artist: client.followed_artist}).composed_hourly_tweet
    client.post(composed_tweet)
  end

  desc "Replies requested songs to unreplied mentions"
  task request: :environment do
    client = TwitterApi.new
    client.save_mentions
    client.reply_unreplied_mentions
  end

end

