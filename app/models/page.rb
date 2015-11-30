class Page < ActiveRecord::Base
  has_many :images
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :categorizations
  has_many :categories, through: :categorizations
end
