class ContentType < ActiveRecord::Base
  has_many :entries
end
