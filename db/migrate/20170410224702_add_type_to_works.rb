class AddTypeToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :type, :string
  end
end
