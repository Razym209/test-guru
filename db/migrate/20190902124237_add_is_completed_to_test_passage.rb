class AddIsCompletedToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :is_completed, :boolean, default: false
  end
end
