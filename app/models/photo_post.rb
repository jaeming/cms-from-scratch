class PhotoPost < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user
  mount_uploader :image, ImageUploader

  default_scope { order('id DESC') }
  scope :published, -> { where(draft: false) }
  scope :drafts, -> { where(draft: true) }

  def author
    self.user
  end

  def featured?
    false
  end
end
