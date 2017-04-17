class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :category
      t.string :title
      t.string :creator
      t.string :publication_year
      t.string :description

      t.timestamps
    end
  end
end
