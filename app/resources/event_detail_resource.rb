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

  has_many   :host_details,
             foreign_key: :host_id

  has_many   :attendees,
             foreign_key: :attendees_id

  has_many   :comments_details,
             foreign_key: :comment_id

  belongs_to :users,
             resource: UserDetailResource,
             foreign_key: :event_id

  # Indirect associations
end
