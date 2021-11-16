json.extract! comments_detail, :id, :comments, :comment_id, :created_at,
              :updated_at
json.url comments_detail_url(comments_detail, format: :json)
