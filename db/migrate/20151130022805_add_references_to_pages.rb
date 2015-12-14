class AddReferencesToPages < ActiveRecord::Migration
  def change
    add_reference :categorizations, :page, index: true
    add_reference :taggings, :page, index: true
    add_reference :comments, :page, index: true
    add_reference :images, :page, index: true
  end
end
