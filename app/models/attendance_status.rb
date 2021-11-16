class AttendanceStatus < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    attendance.to_s
  end

end
