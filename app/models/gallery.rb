class Gallery < ActiveRecord::Base
  has_many :photo_posts

  def photos
    self.photo_posts
  end

end
