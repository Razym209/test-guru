class RemoveColumnAuthodIdFromTest < ActiveRecord::Migration[5.2]
  def change
    remove_column(:tests, :author_id, :integer)
  end
end
