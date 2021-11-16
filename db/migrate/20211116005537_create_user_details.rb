class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.integer :user_id
      t.string :user_email
      t.string :user_first_name
      t.string :password
      t.string :user_last_name

      t.timestamps
    end
  end
end
