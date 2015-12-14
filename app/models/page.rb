class Page < ActiveRecord::Base
  has_many :images
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :categorizations
  has_many :categories, through: :categorizations

  def self.tagged_with(topic)
    tags = Tag.find_by(topic: topic) || Tag.new(topic: topic)
    tags.pages
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
