class AttendeeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :attendees_id, :integer
  attribute :attendees_names, :string

  # Direct associations

  belongs_to :event,
             resource: EventDetailResource,
             foreign_key: :attendees_id

  # Indirect associations

end
