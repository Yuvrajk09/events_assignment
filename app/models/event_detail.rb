class EventDetail < ApplicationRecord
  # Direct associations

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
