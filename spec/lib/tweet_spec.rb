require 'rails_helper'

describe Tweet do

  let!(:api) { TwitterApi.new }

  describe ".client" do
    it "receives client" do
      expect(TwitterApi).to receive(:new)
      Tweet.client
    end
  end

  describe  ".requests" do
    before :each do
      allow(Tweet).to receive(:requests)
    end
    it "receives save_mentions" do
      expect(api).to receive(:save_mentions)
      api.save_mentions
    end
    it "receives reply_unreplied_mentions" do
      expect(api).to receive(:reply_unreplied_mentions)
      api.reply_unreplied_mentions
    end
  end

  describe ".random_song" do
    before :each do
      allow(Tweet).to receive(:random_song)
    end
    it "receives followed_artist" do
      expect(api).to receive(:followed_artist)
      api.followed_artist
    end
    it "receives update" do
      expect(api).to receive(:update).with("hello")
      api.update("hello")
    end
  end


end
