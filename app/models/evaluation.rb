class Evaluation < ApplicationRecord
  enum user: { sold_user: 1, bought_user: 2 }
  enum evaluation: { good: 1, normal: 2, bad: 3 }

  validates :evaluation, presence: true
end