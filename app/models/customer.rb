class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :favorited_custmers, through: :favorites, source: :post

  def follow(other_customer)
   unless self == other_customer
     self.relationships.find_or_create_by(follow_id: other_customer.id)
   end
  end
  def unfollow(other_customer)
   relationship = self.relationships.find_by(follow_id: other_customer.id)
   relationship.destroy if relationship
  end
  def following?(other_customer)
   self.followings.include?(other_customer)
  end
end
