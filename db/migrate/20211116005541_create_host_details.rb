class CreateHostDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :host_details do |t|
      t.integer :host_id
      t.string :host_name

      t.timestamps
    end
  end
end
