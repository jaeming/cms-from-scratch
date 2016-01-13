class Gallery < ActiveRecord::Base
  belongs_to :user
  has_many :photo_posts

  def photos
    self.photo_posts
  end

  def as_json(options=nil)
    super({only: [:id, :title], include: {photos: {only: [:id, :image]}}}.merge(options))
  end

  def author
    self.user
  end

  def thumb
    self.photos.first.image.thumb
  end

end
