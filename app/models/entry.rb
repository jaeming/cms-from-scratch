class Entry < ActiveRecord::Base
  belongs_to :content_type
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(topic)
    Tag.find_by(topic: topic).entries
  end

  def all_tags=(topics)
    self.tags = topics.downcase.split(/[\s,]+/).map do |topic|
        Tag.where(topic: topic.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:topic).join(", ")
  end

end
