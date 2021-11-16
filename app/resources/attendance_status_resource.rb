class AttendanceStatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :attendance_id, :integer
  attribute :status, :string

  # Direct associations

  belongs_to :attendance,
             resource: AttendeeResource

  # Indirect associations
end
