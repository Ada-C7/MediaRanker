class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :creator
      t.integer :year_published
      t.text :description
      t.string :category
      t.timestamps
    end
  end
end
