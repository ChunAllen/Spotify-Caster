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

  # Replies requested songs to unreplied mentions
  def reply_unreplied_mentions
    Mention.unreplied_mentions.each do |mention|
      message = SpotifyApi.new(mention.mentioned_user, mention.reply_to).composed_reply_tweet
      @client.update(message, in_reply_to_status_id: mention.mention_id)
      mention.update(status: "replied")
    end
  end

end

