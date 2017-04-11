class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    #i didn't create this as a join table through rails generate model
    #I'm editing the migration before typing db:migrate
    create_join_table :users, :works, table_name: :votes do |t|
      t.index :user_id
      t.index :work_id
      t.timestamps
    end
  end
end
