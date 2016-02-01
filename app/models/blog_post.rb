class BlogPost < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  include Taggings

  scope :published, -> { where(draft: false) }
  scope :drafts, -> { where(draft: true) }

  def author
    self.user.nickname
  end

end
