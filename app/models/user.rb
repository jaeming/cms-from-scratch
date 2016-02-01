class User < ActiveRecord::Base
  has_many :blog_posts
  has_many :galleries
  has_many :photo_posts
  include Clearance::User
  mount_uploader :avatar, AvatarUploader

  def profile_avatar
    self.avatar.file ? self.avatar : "user-avatar.jpg"
  end

  def nickname
    (name || email.split('@')[0]).capitalize
  end

end
