class ChangePublicatioYearColumnName < ActiveRecord::Migration[5.0]
  def change
    remove_column :works, :publish_year
    add_column :works, :publication_year, :integer

  end
end
