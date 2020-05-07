class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title,
    presence: true,
    length: { minimum: 3 }
  validates :content, presence: true
  has_many :likes
end
