class TestPair < ApplicationRecord
  belongs_to :challenge
  enum test_pair_type: [:integer, :string, :array]
end
