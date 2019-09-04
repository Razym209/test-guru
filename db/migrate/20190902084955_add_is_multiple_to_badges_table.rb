class AddIsMultipleToBadgesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :is_multiple, :boolean, default: false
  end
end
