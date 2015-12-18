class RemoveComments < ActiveRecord::Migration
  def change
    remove_reference :comments, :page
    remove_reference :comments, :blog_post
    drop_table :comments
    remove_column :settings, :comments_approval, :boolean
    remove_column :settings, :comments_only_registered, :boolean
  end
end
