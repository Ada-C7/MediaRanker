class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :by
      t.integer :year
      t.text :description
      t.text :media_type

      t.timestamps
    end
  end
endc
