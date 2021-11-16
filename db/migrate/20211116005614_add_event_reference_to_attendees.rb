class AddEventReferenceToAttendees < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attendees, :event_details, column: :attendees_id
    add_index :attendees, :attendees_id
    change_column_null :attendees, :attendees_id, false
  end
end
