class CommentsDetail < ApplicationRecord
  # Direct associations

  belongs_to :event_comment,
             :class_name => "EventDetail",
             :foreign_key => "comment_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    comments
  end

end
