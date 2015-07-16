class AddManufacturerToItems < ActiveRecord::Migration
  def change
    add_column :items, :manufacturer, :string
  end
end
