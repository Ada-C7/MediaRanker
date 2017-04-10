class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :creator
      t.integer :pub_yr
      t.text :desc
      t.string :type

      t.timestamps
    end
  end
end
