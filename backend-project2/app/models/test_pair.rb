class TestPair < ApplicationRecord
  belongs_to :challenge
  enum input_type: [:integer, :string, :array]
  enum output_type: [:integer, :string, :array]
end
