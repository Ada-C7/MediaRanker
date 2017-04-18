class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :category
      t.string :title
      t.string :creator
      t.string :publish_year
      t.string :description

      t.timestamps
    end
  end
end
