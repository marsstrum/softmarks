class CreateUserTopics < ActiveRecord::Migration
  def change
    create_table :user_topics do |t|
      t.integer :user_id
      t.integer :bookmark_id

      t.timestamps
    end
  end
end
