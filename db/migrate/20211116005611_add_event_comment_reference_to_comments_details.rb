class AddEventCommentReferenceToCommentsDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments_details, :event_details, column: :comment_id
    add_index :comments_details, :comment_id
    change_column_null :comments_details, :comment_id, false
  end
end
