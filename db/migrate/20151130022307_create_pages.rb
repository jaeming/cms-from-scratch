class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.text :keywords

      t.timestamps null: false
    end
  end
end
