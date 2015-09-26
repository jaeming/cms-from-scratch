class Tag < ActiveRecord::Base
  belongs_to :entry
  has_many :taggings
  has_many :entries, through: :taggings
end
