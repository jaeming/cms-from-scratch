class ChangeEntryReferences < ActiveRecord::Migration
  def change
    remove_reference :entries, :content_type
  end
end
