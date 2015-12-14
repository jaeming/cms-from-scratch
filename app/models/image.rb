class Image < ActiveRecord::Base
  belongs_to :blog_post
  belongs_to :page
end
