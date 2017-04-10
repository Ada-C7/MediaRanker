class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.string :category
      t.string :title
      t.string :created_by
      t.string :description
      t.string :published

      t.timestamps
    end
  end
end
