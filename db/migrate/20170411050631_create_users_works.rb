class CreateUsersWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :users_works do |t|
      t.integer :user_id
      t.integer :work_id

    end
  end
end
