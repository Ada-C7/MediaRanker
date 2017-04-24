class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :category
      t.string :title
      t.string :creator
      t.string :publication_year
      t.string :description
      t.integer :users_count

      #do i need to do this if i have a many-to-many table with the relationship defined.
      #t.belongs_to :user

      t.timestamps
    end
  end
end
