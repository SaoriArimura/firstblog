class AddCategoryIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :category_id, :int
  end
end
