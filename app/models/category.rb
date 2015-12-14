class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :entries, through: :categorizations
  has_many :pages, through: :categorizations  
end
