require 'twitter'

class TwitterApi

  attr_accessor :client

  def initialize
    @client = TWITTER_CLIENT
  end

  # post a tweet user bot account
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

  # Replies requested songs to unreplied mentions using bot account
  def reply_unreplied_mentions
    Mention.unreplied_mentions.each do |mention|
      transaction(mention)
    end
  end

  private

    def transaction(mention)
      begin
        message = SpotifyApi.new({artist: mention.mentioned_user, reply_to: mention.reply_to}).composed_reply_tweet
        @client.update(message, in_reply_to_status_id: mention.mention_id)
        mention.update(status: "replied")
      rescue Exception => e
        Rails.logger.fatal "Failed to reply to a tweet due to: #{e}"
      end
    end

end

