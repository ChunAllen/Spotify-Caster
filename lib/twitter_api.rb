require 'twitter'

class TwitterApi

  attr_accessor :client

  def initialize
    @client = TWITTER_CLIENT
  end

  # post a tweet from @spotifycaster account
  def post(tweet)
    @client.update(tweet)
  end

  # Returns a name from the followed artists
  def followed_artist
    @client.following.attrs[:users].map { |user| user[:name] }.sample
  end

  # Get mentions that doesn't have replies
  def save_mentions
    Mention.save_mentions(@client.mentions_timeline)
  end

  # Replies to all unmentions tweets
  def reply_to_all_unmentions
    Mention.unreplied_mentions.each do |mention|
      message = SpotifyApi.new(mention.mentioned_user).composed_reply_tweet(mention.reply_to)
      @client.update(message, in_reply_to_status_id: mention.mention_id)
      mention.update(status: "replied")
    end
  end

end

