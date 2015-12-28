class Gallery < ActiveRecord::Base
  has_many :photo_posts

  def photos
    self.photo_posts
  end

  def as_json(options=nil)
    super({only: [:id, :title], include: {photos: {only: [:id, :image]}}}.merge(options))
  end

end
