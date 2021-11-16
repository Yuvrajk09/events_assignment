class CreateCommentsDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :comments_details do |t|
      t.string :comments
      t.integer :comment_id

      t.timestamps
    end
  end
end
