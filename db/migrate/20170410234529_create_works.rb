class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :creator
      t.text :description
      t.integer :year
      t.string :category

      t.timestamps
    end
  end
end
