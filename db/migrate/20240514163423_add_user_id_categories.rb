class AddUserIdCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categoriess, :user, null: false, foreign_key: true
  end
end
