class Tag < ActiveRecord::Base
  belongs_to :entry
  belongs_to :page
  has_many :taggings
  has_many :entries, through: :taggings
  has_many :pages, through: :taggings  
end
