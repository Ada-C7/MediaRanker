class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.integer :year_published
      t.string :title
      t.string :creator
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
