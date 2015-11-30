class Categorization < ActiveRecord::Base
  belongs_to :entry
  belongs_to :page    
  belongs_to :category
end
