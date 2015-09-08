class Tweet

  extend TweetComposer

  def self.client
    TwitterApi.new
  end

  def self.requests
    client.save_mentions
    client.reply_unreplied_mentions
  end

  def self.random_song
    spotify_client = SpotifyApi.new(client.followed_artist)
    message = composed_tweet({
      track_name: spotify_client.track.try(:name),
      artist_name: spotify_client.artist.try(:name),
      player: spotify_client.player
    })
    client.update(message)
  end

end
