class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :string
      t.string :title
      t.text :description
      t.string :category
      t.integer :published
      t.timestamps
    end
  end
end
