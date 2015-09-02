require 'twitter'

class TwitterApi

  def self.integrate
    Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets[:TWITTER_CONSUMER_KEY]
      config.consumer_secret = Rails.application.secrets[:TWITTER_CONSUMER_SECRET]
      config.access_token = Rails.application.secrets[:TWITTER_ACCESS_TOKEN]
      config.access_token_secret = Rails.application.secrets[:TWITTER_ACCESS_TOKEN_SECRET]
    end
  end

end

