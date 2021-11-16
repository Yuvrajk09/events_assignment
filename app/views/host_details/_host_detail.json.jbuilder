json.extract! host_detail, :id, :host_id, :host_name, :created_at, :updated_at
json.url host_detail_url(host_detail, format: :json)
