require 'twitter'

class TwitterApi

  attr_accessor :client

  def initialize
    @client = integrate
  end

  def update(tweet)
    @client.update(tweet)
  end

  def followed_artist
    @client.following.attrs[:users].map { |user| user[:name] }.sample
  end

  private

    def integrate
      Twitter::REST::Client.new do |config|
        config.consumer_key = Rails.application.secrets[:TWITTER_CONSUMER_KEY]
        config.consumer_secret = Rails.application.secrets[:TWITTER_CONSUMER_SECRET]
        config.access_token = Rails.application.secrets[:TWITTER_ACCESS_TOKEN]
        config.access_token_secret = Rails.application.secrets[:TWITTER_ACCESS_TOKEN_SECRET]
      end
    end

end

