class Request

  def self.send
    twitter_client = TwitterApi.new
    twitter_client.save_mentions
    twitter_client.reply_unreplied_mentions
  end

end
