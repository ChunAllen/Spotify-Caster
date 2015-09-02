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
    "NP: #{@track.name} by #{@track.artists.first.name} listen now on #{@player}"
  end


end
