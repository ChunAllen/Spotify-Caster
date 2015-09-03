require 'rspotify'

class SpotifyApi

  attr_accessor :artist, :track, :player

  def initialize(artist)
    @artist = RSpotify::Artist.search(artist).first
    @track = @artist.top_tracks(:us).sample
    @player = player
  end

  def player
    RSpotify::Track.find(@track.id).external_urls["spotify"]
  end

  def composed_tweet
    "#{@track.name} by #{@track.artists.first.name} listen now on #{@player}"
  end

  def composed_reply_tweet(screen_name)
    "Hi @#{screen_name} here's a song from #{@track.artists.first.name} listen now on #{@player}"
  end


end
