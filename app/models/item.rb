class Item < ApplicationRecord
  belongs_to :user
  acts_as_list scope: :user
  enum list: { morning: 0, lunch: 1, afternoon: 2, evening: 3 }
end
