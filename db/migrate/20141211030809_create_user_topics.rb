class CreateUserTopics < ActiveRecord::Migration
  def change
    create_table :user_topics do |t|
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
    add_index :user_topics, :user_id
    add_index :user_topics, :topic_id
  end
end
