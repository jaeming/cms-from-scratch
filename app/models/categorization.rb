class Categorization < ActiveRecord::Base
  belongs_to :blog_post
  belongs_to :page
  belongs_to :category
end
