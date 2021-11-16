class AttendanceStatus < ApplicationRecord
  # Direct associations

  belongs_to :attendance,
             class_name: "Attendee"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    attendance.to_s
  end
end
