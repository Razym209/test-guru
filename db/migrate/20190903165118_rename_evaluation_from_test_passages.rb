class RenameEvaluationFromTestPassages < ActiveRecord::Migration[5.2]
  def change
    rename_column :test_passages, :evaluation, :passed
  end
end
