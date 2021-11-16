class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.integer :attendees_id
      t.string :attendees_names

      t.timestamps
    end
  end
end
