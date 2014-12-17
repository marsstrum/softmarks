class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.string :image
      t.integer :topic_id
      t.references :user, index: true

      t.timestamps
    end
    add_index :bookmarks, :topic_id
  end
end
