require 'twitter'

class TwitterApi

  attr_accessor :client

  def initialize
    @client = TWITTER_CLIENT
  end

  def update(tweet)
    @client.update(tweet)
  end

  def followed_artist
    @client.following.attrs[:users].map { |user| user[:name] }.sample
  end

end

