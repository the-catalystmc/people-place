class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: { message: 'Title field cannot be blank' }
  validates :title, length: { maximum: 250, too_long: '250 characters is the maximum allowed for the title' }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_author_posts
    counter = author.posts.count('id')
    author.update(posts_counter: counter)
  end

  def recent_comments(quantity)
    comments.order(created_at: :desc).limit(quantity)
  end

  def five_recent_comments
    recent_comments(5)
  end

  def comments_counter
    comments.count
  end

  def likes_counter
    likes.count
  end
end
