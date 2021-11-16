class EventDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :event_id, :integer
  attribute :event_name, :string
  attribute :event_startdate, :string
  attribute :event_start_time, :string
  attribute :event_details, :string
  attribute :event_end_date, :string
  attribute :event_end_time, :string
  attribute :event_location, :string

  # Direct associations

  # Indirect associations

end
