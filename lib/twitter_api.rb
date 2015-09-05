class TwitterApi

  include TweetComposer

  attr_accessor :client

  def initialize
    @client = TWITTER_CLIENT
  end

  # post a tweet user bot account
  def update(tweet)
    @client.update(tweet)
  end

  # Returns a name from the followed artists
  def followed_artist
    @client.following.attrs[:users].map { |user| user[:name] }.sample
  end

  # Get mentions that doesn't have replies
  def save_mentions
    @client.mentions.timeline.each do |mention|
      Mention.save_mention(mention)
    end
  end

  # Replies requested songs to unreplied mentions using bot account
  def reply_unreplied_mentions
    Mention.unreplied_mentions.each do |mention|
      transaction(mention)
    end
  end


  def transaction(mention)
    begin
      spotify_client = SpotifyApi.new({artist: mention.mentioned_user})

      message = composed_tweet({reply_to: mention.reply_to,
                             track_name: spotify_client.track.try(:name),
                             artist_name: spotify_client.artist.try(:name),
                             player: spotify_client.player
      })

      @client.update(message, in_reply_to_status_id: mention.mention_id)
      mention.update(status: "replied")
    rescue Exception => e
      Rails.logger.fatal "Failed to reply to a tweet due to: #{e}"
    end
  end


end

