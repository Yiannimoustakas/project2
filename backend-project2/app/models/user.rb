class User < ApplicationRecord
  has_secure_password
  has_many :solutions
  has_many :challenges
  validates :email, presence: true, uniqueness: true
end
