class BlogPost < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  include Taggings

  default_scope { order('id DESC') }
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }

end
