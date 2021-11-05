class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: { message: 'Text field cannot be empty.' }

  def update_post_comments
    counter = post.comments.count('id')
    post.update(comments_counter: counter)
  end
end
