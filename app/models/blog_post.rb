class BlogPost < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  after_create :set_author
  include Taggings

  scope :published, -> { where(draft: false) }
  scope :drafts, -> { where(draft: true) }

  def set_author
    self.author = self.user.nickname
    self.save
  end

end
