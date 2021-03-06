class HostDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :host_id, :integer
  attribute :host_name, :string

  # Direct associations

  belongs_to :host,
             resource: EventDetailResource

  # Indirect associations
end
