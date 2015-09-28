class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.boolean :comments_approval
      t.boolean :comments_only_registered
      t.boolean :new_user_signups
      t.string :site_title
      t.text :site_description
      t.string :timezone

      t.timestamps null: false
    end
  end
end
