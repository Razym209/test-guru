class CreateRoleUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :role_users do |t|
      t.integer :user_id, null: false
      t.integer :role_id, null: false
      t.timestamps
    end
  end
end
