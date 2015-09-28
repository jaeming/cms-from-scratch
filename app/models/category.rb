class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :entries, through: :categorizations
end
