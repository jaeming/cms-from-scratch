class CreatePhotoPosts < ActiveRecord::Migration
  def change
    create_table :photo_posts do |t|
      t.string :image
      t.string :description
      t.string :title
      t.boolean :published
      t.belongs_to :gallery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
