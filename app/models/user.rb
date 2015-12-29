class User < ActiveRecord::Base
  has_many :blog_posts
  has_many :galleries
  has_many :photo_posts
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
end
