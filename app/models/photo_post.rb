class PhotoPost < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user
  mount_uploader :image, ImageUploader

  def author
    self.user
  end
end
