class AddQuestionToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :question_content, :string
  end
end
