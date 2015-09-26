class CreateContentTypes < ActiveRecord::Migration
  def change
    create_table :content_types do |t|
      t.string :kind

      t.timestamps null: false
    end
  end
end
