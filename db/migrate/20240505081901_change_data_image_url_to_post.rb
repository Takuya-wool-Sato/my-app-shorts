class ChangeDataImageUrlToPost < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :image_url, :text
  end
end
