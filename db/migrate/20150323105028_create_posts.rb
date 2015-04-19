class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :category_tag_id
      t.integer :state
      t.text :review
      t.integer :recommend_rate

      t.timestamps null: false
    end
 add_index :posts, [:user_id, :created_at]
  end
end
