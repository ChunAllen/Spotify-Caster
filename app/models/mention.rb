class Mention < ActiveRecord::Base

  scope :unreplied_mentions, -> { where(status: "unreplied") }

  def self.save_mentions(mentions)
    mentions.each do |mention|
      where(mention_id: mention.id).first_or_create do |attr|
        attr.mention_id = mention.id
        attr.reply_to = mention.user.screen_name
        attr.mentioned_user = mention.user_mentions.last.name
      end
    end
  end

end
