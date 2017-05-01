class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :created_by
      t.integer :published_year
      t.string :description

      t.timestamps
    end
  end
end
