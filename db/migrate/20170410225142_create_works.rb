class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :type
      t.string :title
      t.integer :published
      t.text :description

      t.timestamps

    end
  end
end
