require 'rspotify'

class SpotifyApi

  attr_accessor :artist, :track, :player

  def initialize(artist)
    @artist = RSpotify::Artist.search(artist).first
    if @artist.present?
      @track = @artist.top_tracks(:us).sample
      @player = player
    end
  end

  def player
    RSpotify::Track.find(@track.id).external_urls["spotify"]
  end

  def composed_hourly_tweet
    "NP: #{@track.name} by #{@track.artists.first.name} listen now on #{@player}"
  end

  def composed_reply_tweet(reply_to)
    if @track.present?
      "Hi @#{reply_to} here's a song from #{@track.artists.first.name} listen now on #{@player}"
    else
      "Oops @#{reply_to} there's no available soundtrack for your artist."
    end
  end


end
