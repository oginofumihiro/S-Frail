class Post < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :post_image, presence: true
  attachment :post_image

  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :customer

  def favorited_by?(post)
    favorites.where(post_id: post.id).exists?
  end

end
