class ChangePubDateToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :works, :pub_date, :string
  end
end
