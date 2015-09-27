class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :author
      t.string :status
      t.references :entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
