class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :body
      t.string :author
      t.string :status
      t.string :feature_image
      t.references :content_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
