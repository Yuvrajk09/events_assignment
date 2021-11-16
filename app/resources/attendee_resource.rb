class AttendeeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :attendees_id, :integer
  attribute :attendees_names, :string

  # Direct associations

  # Indirect associations

end
