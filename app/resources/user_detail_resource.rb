class UserDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :user_email, :string
  attribute :user_first_name, :string
  attribute :password, :string
  attribute :user_last_name, :string

  # Direct associations

  has_many   :events,
             resource: EventDetailResource,
             foreign_key: :event_id

  # Indirect associations

  has_many :comments_details do
    assign_each do |user_detail, comments_details|
      comments_details.select do |c|
        c.id.in?(user_detail.comments_details.map(&:id))
      end
    end
  end

end
