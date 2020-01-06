class Evaluation < ApplicationRecord
  enum user: { sold_user: 1, bought_user: 2 }
  enum evaluation: { good: 1, normal: 2, bad: 3 }

  class << self
    def evaluation(evaluation, order)
    
      if order.status == 'received'
        evaluation.order_id = order.id
        order.status = 'evaluated'
        evaluation.user = 'bought_user'
        evaluation.point = Evaluation.point(evaluation.evaluation)

      else order.status == 'evaluated'
        evaluation.order_id = order.id
        order.status = 'finished'
        evaluation.user = 'sold_user'
        evaluation.point = Evaluation.point(evaluation.evaluation)

      end
      ActiveRecord::Base.transaction do
        evaluation.save
        order.save
      end

      if order.status == 'finished'
        Evaluation.evaluation_point(order.id)
      end

    end

    def point(evaluation)
      if evaluation == "good"
        return 2
      elsif evaluation == "normal"
        return 1
      elsif evaluation == "bad"
        return -1
      end
    end

    def evaluation_point(order_id)
      bought_user_evaluation = Evaluation.find_by(order_id: order_id, user: "bought_user")
      bought_user = User.find(bought_user_evaluation.user_id)
      bought_user.evaluation_point += bought_user_evaluation.point


      sold_user_evaluation = Evaluation.find_by(order_id: order_id, user: "sold_user")
      sold_user = User.find(sold_user_evaluation.user_id)
      sold_user.evaluation_point += sold_user_evaluation.point
      byebug

      ActiveRecord::Base.transaction do
        bought_user.save
        sold_user.save
      end

    end


  end  
end
