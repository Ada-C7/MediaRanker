class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :created_by
      t.text :description
      t.string :category
      t.integer :year_published

      t.timestamps
    end
  end
end
