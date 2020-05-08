class User < ApplicationRecord
  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :comments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :description,
    presence: true
  has_secure_password
  has_many :likes
end
