class CreateAttendanceStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_statuses do |t|
      t.integer :attendance_id
      t.string :status

      t.timestamps
    end
  end
end
