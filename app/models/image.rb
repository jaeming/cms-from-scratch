class Image < ActiveRecord::Base
  belongs_to :entry
  belongs_to :page  
end
