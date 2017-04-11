class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :category
      t.string :name
      t.string :created_by
      t.integer :pub_year
      t.text :desc

      t.timestamps
    end
  end
end
