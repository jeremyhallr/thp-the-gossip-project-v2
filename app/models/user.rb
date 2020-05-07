class User < ApplicationRecord
  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :comments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :description,
    presence: true,
    length: { minimum: 30 }
  has_secure_password
end
