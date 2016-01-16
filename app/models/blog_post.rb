class BlogPost < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  include Taggings

  default_scope { order('id DESC') }
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }

  def author
    self.user.name || self.user.email
  end

end
