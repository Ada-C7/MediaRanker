class AddColumn < ActiveRecord::Migration[5.0]
  def change
  add_column :works, :publication_date, :string
  end
end
