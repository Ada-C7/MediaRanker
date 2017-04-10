class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :type
      t.string :title
      t.text :description
      t.string :creator
      t.integer :publication_year

      t.timestamps
    end
  end
end
