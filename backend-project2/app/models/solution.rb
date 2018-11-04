class Solution < ApplicationRecord
  belongs_to :user, optional: true
end
