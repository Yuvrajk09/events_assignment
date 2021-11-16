class CreateEventDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :event_details do |t|
      t.integer :event_id
      t.string :event_name
      t.string :event_startdate
      t.string :event_start_time
      t.string :event_details
      t.string :event_end_date
      t.string :event_end_time
      t.string :event_location

      t.timestamps
    end
  end
end
