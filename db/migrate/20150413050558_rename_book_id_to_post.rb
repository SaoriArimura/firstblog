class RenameBookIdToPost < ActiveRecord::Migration
  def up
    rename_column :posts, :book_id, :item_id 
  end

  def down
    rename_column :posts, :item_id, :book_id
  end
end
