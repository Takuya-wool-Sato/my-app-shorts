class AddImgaeUrlToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :image_url, :string
    add_column :posts, :meta_title, :string
    add_column :posts, :meta_description, :string
  end
end
