class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :blog_posts, through: :categorizations
  has_many :pages, through: :categorizations
end
