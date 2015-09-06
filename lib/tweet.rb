class Tweet

  extend TweetComposer

  @@twitter_client = TwitterApi.new

  def self.requests
    @@twitter_client.save_mentions
    @@twitter_client.reply_unreplied_mentions
  end

  def self.random_song
    spotify_client = SpotifyApi.new(@@twitter_client.followed_artist)
    message = composed_tweet({
      track_name: spotify_client.track.try(:name),
      artist_name: spotify_client.artist.try(:name),
      player: spotify_client.player
    })
    @@twitter_client.update(message)
  end

end
