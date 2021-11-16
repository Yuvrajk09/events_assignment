class CommentsDetail < ApplicationRecord
  # Direct associations

  belongs_to :event_comment,
             class_name: "EventDetail",
             foreign_key: "comment_id"

  # Indirect associations

  has_one    :user,
             through: :event_comment,
             source: :users

  # Validations

  # Scopes

  def to_s
    comments
  end
end
