class AddUserToPhotoPosts < ActiveRecord::Migration
  def change
    add_reference :photo_posts, :user, index: true, foreign_key: true
  end
end
