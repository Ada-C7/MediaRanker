class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :category
      t.string :title
      t.string :creator
      t.string :publication_year
      t.text :description

      t.timestamps
    end
  end
end
