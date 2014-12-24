class CreateLikeBookmarks < ActiveRecord::Migration
  def change
    create_table :like_bookmarks do |t|
      t.references :user, index: true
      t.references :bookmark, index: true

      t.timestamps
    end
  end
end
