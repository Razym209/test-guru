class AddResourceTypeToUserBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :user_badges, :resource_type, :string
  end
end
