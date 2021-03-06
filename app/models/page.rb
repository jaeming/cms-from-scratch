class Page < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  include Taggings

  default_scope { order('id DESC') }
  scope :published, -> { where(draft: false) }
  scope :drafts, -> { where(draft: true) }

end
