class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :delete_all, foreign_key: 'author_id'
  has_many :comments, dependent: :delete_all, foreign_key: 'author_id'
  has_many :likes, dependent: :delete_all, foreign_key: 'author_id'

  # attr_accessible :name , :email

  # # User::Roles
  # # The available roles
  # Roles = [ :admin , :default ]

  # def is?( requested_role )
  #   self.role == requested_role.to_s
  # end

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc)
  end

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def posts_counter
    posts.count
  end

  def admin?
    role == 'Admin'
  end
end
