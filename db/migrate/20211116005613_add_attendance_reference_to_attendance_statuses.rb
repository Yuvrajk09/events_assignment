class AddAttendanceReferenceToAttendanceStatuses < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attendance_statuses, :attendees, column: :attendance_id
    add_index :attendance_statuses, :attendance_id
    change_column_null :attendance_statuses, :attendance_id, false
  end
end
