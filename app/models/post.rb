class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :item_id, presence:true

  paginates_per 5 



  # validates :recommend_rate, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to:5}
  belongs_to :user 
  belongs_to :item
  belongs_to :category, foreign_key: "category_tag_id"
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, :through => :favorite, :source => :user
  has_many :replies, dependent: :destroy
  #デフォの順番の指定
  default_scope -> { order('created_at DESC') }

  def favorited_by? user
    favorites.where(user_id: user.id).exists?
  end



end
