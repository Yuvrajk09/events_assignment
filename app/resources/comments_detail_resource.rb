class CommentsDetailResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :comments, :string
  attribute :comment_id, :integer

  # Direct associations

  # Indirect associations

end