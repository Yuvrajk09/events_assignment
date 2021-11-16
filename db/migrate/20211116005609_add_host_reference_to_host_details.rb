class AddHostReferenceToHostDetails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :host_details, :event_details, column: :host_id
    add_index :host_details, :host_id
    change_column_null :host_details, :host_id, false
  end
end
