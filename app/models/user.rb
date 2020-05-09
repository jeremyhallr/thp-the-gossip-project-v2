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

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end
end
