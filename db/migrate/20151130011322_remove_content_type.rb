class RemoveContentType < ActiveRecord::Migration
  def change
    drop_table :content_types
  end
end
