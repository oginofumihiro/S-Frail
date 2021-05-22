class Post < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :post_image, presence: true
  attachment :post_image

  belongs_to :genre

end
