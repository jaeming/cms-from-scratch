class AddGalleryFeatureIdToPhotoPost < ActiveRecord::Migration
  def change
    add_column :galleries, :featured_id, :integer
  end
end
