json.extract! attendee, :id, :attendees_id, :attendees_names, :created_at,
              :updated_at
json.url attendee_url(attendee, format: :json)
