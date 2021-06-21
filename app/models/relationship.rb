class Relationship < ApplicationRecord
  belongs_to :customer
  belongs_to :follow, class_name: 'Customer', foreign_key: "follow_id"
  validates :customer_id, presence: true
  validates :follow_id, presence: true
end
