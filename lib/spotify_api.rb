require 'rspotify'

class SpotifyApi

  attr_accessor :artist, :track, :player, :reply_to

  def initialize(artist, reply_to = nil)
    @artist = RSpotify::Artist.search(artist).first
    @reply_to = reply_to
    @track = @artist.top_tracks(:us).sample
    @player = player
  end

  def player
    RSpotify::Track.find(@track.id).external_urls["spotify"]
  end

  def composed_hourly_tweet
    "NP: #{@track.name} by #{@track.artists.first.name} listen now on #{@player}"
  end

  def composed_reply_tweet
    if @track.present?
    "Hi @#{@reply_to} here's \"#{@track.name}\" by #{@track.artists.first.name} listen now on #{@player}"
    else
      "Oops @#{@reply_to} there's no available soundtrack for your artist."
    end
  end


end
