class Tagging < ActiveRecord::Base
  belongs_to :entry
  belongs_to :page    
  belongs_to :tag
end
