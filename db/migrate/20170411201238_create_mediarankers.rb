class CreateMediarankers < ActiveRecord::Migration[5.0]
  def change
    create_table :mediarankers do |t|

      t.timestamps
    end
  end
end
