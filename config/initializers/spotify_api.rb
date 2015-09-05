require 'rspotify'
RSpotify.authenticate(Rails.application.secrets[:SPOTIFY_CLIENT_ID],
                      Rails.application.secrets[:SPOTIFY_CLIENT_SECRET])
