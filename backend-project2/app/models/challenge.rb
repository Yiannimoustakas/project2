class Challenge < ApplicationRecord
  belongs_to :user
  has_many :solutions
  has_many :test_pairs
  has_many :comments 
end
