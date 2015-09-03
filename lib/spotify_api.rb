require 'rspotify'

class SpotifyApi

  attr_accessor :artist, :track, :player, :reply_to

  # TODO check all tracks instead of top_tracks from us
  def initialize(params = {})
    @artist = RSpotify::Artist.search(params[:artist]).first
    @reply_to = params[:reply_to]
    @track = @artist.top_tracks(:us).sample
    @player = player
  end

  def player
    RSpotify::Track.find(@track.id).external_urls["spotify"]
  end

  def composed_hourly_tweet
    "NP: #{@track.name} by #{@track.artists.first.name} listen now on #{@player}"
  end

  # TODO validate if there's a found track or artist if not post a not found reply message
  def composed_reply_tweet
    "Hi @#{@reply_to} here's \"#{@track.name}\" by #{@track.artists.first.name} listen now on #{@player}"
  end


end
