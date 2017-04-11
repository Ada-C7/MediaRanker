class AddCreatorToWorksAndDefaultForDescription < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :creator, :string
    change_column :works, :description, :string, default: "Description coming soon!"
  end
end
