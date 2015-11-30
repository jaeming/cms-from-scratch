class AddReferencesToPages < ActiveRecord::Migration
  def change
    add_reference :categorizations, :pages, index: true
    add_reference :taggings, :pages, index: true
    add_reference :comments, :pages, index: true
    add_reference :images, :pages, index: true
  end
end
