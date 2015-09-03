class Request

  def self.run
    client = TwitterApi.new
    client.save_mentions
    client.reply_unreplied_mentions
  end

end
