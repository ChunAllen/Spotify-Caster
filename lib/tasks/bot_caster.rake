require 'tweet_composer'

namespace :tweet do

  include TweetComposer

  desc "Tweets a random song from your followed artists"
  task random_song: :environment do
    twitter_client = TwitterApi.new
    spotify_client = SpotifyApi.new(twitter_client.followed_artist)
    message = composed_tweet({
      track_name: spotify_client.track.try(:name),
      artist_name: spotify_client.artist.try(:name),
      player: spotify_client.player
    })
    twitter_client.update(message)
  end

  desc "Sends requested songs to unreplied mentions"
  task request: :environment do
    Request.send
  end

end

