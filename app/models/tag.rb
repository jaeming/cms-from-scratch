class Tag < ActiveRecord::Base
  belongs_to :blog_post
  belongs_to :page
  has_many :taggings
  has_many :blog_posts, through: :taggings
  has_many :pages, through: :taggings
end
