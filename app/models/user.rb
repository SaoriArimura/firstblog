class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, 
    :authentication_keys => [:name]
  
  validates_uniqueness_of :name
  validates_presence_of :name
  validates :name, presence: true, length: { maximum: 50 }

  #画像
  mount_uploader :image, ImageUploader

  def current_user?(current_user)
    self.id == @current_user.id
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["name = :value", { :value => name }]).first
    else
      where(conditions).first
    end
  end

  #ユーザーがポストを複数所有する
  has_many :posts, dependent: :destroy
  #お気に入り
  has_many :favorites, dependent: :destroy 
  has_many :favorite_posts, through: :favorites, :source => :post
  has_many :replies, dependent: :destroy
  #ユーザー/リレーションシップのhas_manyの関連付けを実装
  #ユーザーを削除したら、ユーザーのリレーションシップも同時に削除される
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  #逆リレーションシップ
  has_many :reverse_relationships, foreign_key: "followed_id", class_name:  "Relationship", dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  #following?ユーティリティメソッドとfollow! ユーティリティメソッド
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  #現在のユーザーによってフォローされているユーザーに対応するユーザーidを持つポストを見る
  #def feed
  #  Post.from_users_followed_by(self)
  #end

end
