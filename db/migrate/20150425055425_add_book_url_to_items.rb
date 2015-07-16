class AddBookUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :bookURL, :string
  end
end
