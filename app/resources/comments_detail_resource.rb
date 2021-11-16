class CommentsDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :comments, :string
  attribute :comment_id, :integer

  # Direct associations

  belongs_to :event_comment,
             resource: EventDetailResource,
             foreign_key: :comment_id

  # Indirect associations

  has_one    :user,
             resource: UserDetailResource

  filter :event_id, :integer do
    eq do |scope, value|
      scope.eager_load(:user).where(:event_details => {:event_id => value})
    end
  end
end
