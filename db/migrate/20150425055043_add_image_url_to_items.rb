class AddImageUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :imgURL, :string
  end
end
