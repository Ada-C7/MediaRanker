class RemovePublicationDateFromWorks < ActiveRecord::Migration[5.0]
  def change
    remove_column :works, :publication_date, :date
    add_column :works, :publication_date, :string
  end
end


#did not know that I had to delete schema for the new column to show up
