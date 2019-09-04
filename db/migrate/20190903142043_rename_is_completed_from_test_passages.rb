class RenameIsCompletedFromTestPassages < ActiveRecord::Migration[5.2]
  def change
    rename_column :test_passages, :is_completed, :completed
  end
end
