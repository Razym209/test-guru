class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :result, from: nil, to: false)
  end
end
