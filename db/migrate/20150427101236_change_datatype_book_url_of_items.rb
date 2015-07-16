class ChangeDatatypeBookUrlOfItems < ActiveRecord::Migration
  def change
 change_column :items, :bookURL, :text
  end
end
