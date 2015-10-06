class CreateNavigations < ActiveRecord::Migration
  def change
    create_table :navigations do |t|
      t.string :link
      t.string :title
      t.integer :order
      t.boolean :new_tab

      t.timestamps null: false
    end
  end
end
