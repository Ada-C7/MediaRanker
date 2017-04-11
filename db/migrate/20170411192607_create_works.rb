class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :creator
      t.integer :year
      t.text :description
      t.string :mediatype
      t.timestamps
    end
  end
end
