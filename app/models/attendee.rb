class Attendee < ApplicationRecord
  # Direct associations

  has_one    :attendance_status,
             foreign_key: "attendance_id",
             dependent: :destroy

  belongs_to :event,
             class_name: "EventDetail",
             foreign_key: "attendees_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event.to_s
  end
end
