namespace :tweet do

  desc "Tweets a random song from your followed artists"
  task random_song: :environment do
    client  = TwitterApi.new
    composed_tweet = SpotifyApi.new(client.followed_artist).composed_hourly_tweet
    client.post(composed_tweet)
  end

end

