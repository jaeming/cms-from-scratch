class RenameStatusColumn < ActiveRecord::Migration
  def change
    remove_column :blog_posts, :status, :string
    add_column :blog_posts, :published, :boolean
    add_column :pages, :published, :boolean    
  end
end
