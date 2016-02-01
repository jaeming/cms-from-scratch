class RemovePublishedColumns < ActiveRecord::Migration
  def change
    remove_column :blog_posts, :published
    remove_column :pages, :published
    remove_column :photo_posts, :published
    add_column :blog_posts, :draft, :boolean, default: false
    add_column :pages, :draft, :boolean, default: false
    add_column :photo_posts, :draft, :boolean, default: false
  end
end
