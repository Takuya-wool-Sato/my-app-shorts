class ChangeDataColumnsToPost < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :url, :text
    change_column :posts, :meta_description, :text
  end
end
