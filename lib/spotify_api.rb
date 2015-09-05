class SpotifyApi

  attr_accessor :artist, :track, :player

  def initialize(params = {})
    @artist = get_artist params[:artist]
    @track = get_random_track
    @player = get_track_url
  end

  # Returns the artist
  def get_artist(artist)
    RSpotify::Artist.search(artist).first
    #available_artists.first.name if available_artists.any?
  end

  # Returns random track from artist
  def get_random_track
    @artist.top_tracks(:us).sample unless @artist.nil?
  end

  # Returns the track url
  def get_track_url
    RSpotify::Track.find(@track.id).external_urls["spotify"] unless @track.nil?
  end


end
