class UserDetail < ApplicationRecord
  # Direct associations

  has_many   :events,
             :class_name => "EventDetail",
             :foreign_key => "event_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user_id
  end

end
