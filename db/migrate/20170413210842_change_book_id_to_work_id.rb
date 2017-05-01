class ChangeBookIdToWorkId < ActiveRecord::Migration[5.0]
  def change
    rename_column :votes, :book_id, :work_id
  end
end
