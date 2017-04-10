class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :category
      t.string :creator
      t.text :description
      t.date :pub_date

      t.timestamps
    end
  end
end
