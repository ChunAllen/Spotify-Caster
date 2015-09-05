require 'rails_helper'

describe TwitterApi do

  let!(:api) { TwitterApi.new }

  describe ".initialize" do
    it "sets the client" do
      expect(api.client).to_not be_nil
    end
  end

  describe "#update" do
    it "post a message to twitter"
  end

end
