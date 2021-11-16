class EventDetail < ApplicationRecord
  # Direct associations

  has_many   :attendees,
             :foreign_key => "attendees_id",
             :dependent => :destroy

  has_many   :comments_details,
             :foreign_key => "comment_id",
             :dependent => :destroy

  belongs_to :users,
             :class_name => "UserDetail",
             :foreign_key => "event_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    users.to_s
  end

end
