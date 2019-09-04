class RenameIsMultipleFromBadges < ActiveRecord::Migration[5.2]
  def change
    rename_column :badges, :is_multiple, :multiple
  end
end
