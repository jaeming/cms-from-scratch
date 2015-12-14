class ChangeEntryReferences < ActiveRecord::Migration
  def change
    remove_reference :blog_posts, :content_type
  end
end
