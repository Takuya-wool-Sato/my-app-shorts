class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|

      t.references :user, null: false, foreign_key: true
      t.integer :swipe_type, null: false, default: 0
      t.integer :interval, null: false, default: 4000
      t.boolean :text_anime, null: false, default: false

      t.timestamps
    end
  end
end
