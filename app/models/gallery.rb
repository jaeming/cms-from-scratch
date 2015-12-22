class Gallery < ActiveRecord::Base
  has_many :photo_posts
end
