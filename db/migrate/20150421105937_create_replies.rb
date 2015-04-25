class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :context
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :replies, :users
    add_foreign_key :replies, :posts
  end
end
