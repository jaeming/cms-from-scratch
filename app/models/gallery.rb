class Gallery < ActiveRecord::Base
  has_many :photo_posts

  def photos
    self.photo_posts
  end

  def as_json(options=nil)
    super(options || {only: [:id, :title], include: {photos: {only: [:id, :image]}}})
  end

end
