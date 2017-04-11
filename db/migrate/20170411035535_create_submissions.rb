class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :category
      t.string :author
      t.string :title
      t.datetime :publish_date
      t.string :summary

      t.timestamps
    end
  end
end
