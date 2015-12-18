class RemoveImages < ActiveRecord::Migration
  def change
    remove_reference :images, :page
    remove_reference :images, :blog_post    
    drop_table :images
  end
end
