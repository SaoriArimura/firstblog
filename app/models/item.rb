class Item < ActiveRecord::Base

  has_many :posts, :dependent => :destroy

 # validates :book_id, uniqueness: true



end
