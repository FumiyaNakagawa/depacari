class Evaluation < ApplicationRecord
  enum status: { sold_user: 1, bought_user: 2 }
  enum evaluations: { good: 1, normal: 2, bad: 3 }
end
