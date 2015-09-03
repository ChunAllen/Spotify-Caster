require 'twitter'

class TwitterApi

  attr_accessor :client

  def initialize
    @client = TWITTER_CLIENT
  end

  # post a tweet from @spotifycaster account
  def update(tweet)
    @client.update(tweet)
  end

  # Returns a name from the followed artists
  def followed_artist
    @client.following.attrs[:users].map { |user| user[:name] }.sample
  end

end

