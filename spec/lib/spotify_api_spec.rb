require 'rails_helper'
require 'webmock/rspec'

describe SpotifyApi, vcr: true do

  let!(:spotify_client_stub) {
    stub_request(:get, "https://api.spotify.com/v1/search?limit=20&offset=0&q=Maroon%205&type=artist").
      with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
  }

  describe ".initialize" do
    it "sets the artist" do
    end

    #context "artist is not nil" do
      #it "sets the track" do
        #expect(spotify_client.track).to_not be_nil
      #end
    #end

    #context "artist is nil" do
      #it "sets track to nil" do
        #expect(unknown_artist.track).to eq nil
      #end
    #end

    #context "track is not nil" do
      #it "sets the player" do
        #expect(spotify_client.player).to_not be_nil
      #end
    #end

    #context "track is nil" do
      #it "sets player to nil" do
        #expect(unknown_artist.player).to eq nil
      #end
    #end

  end

end

