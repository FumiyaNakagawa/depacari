class Evaluation < ApplicationRecord
  enum user: { sold_user: 1, bought_user: 2 }
  enum evaluation: { good: 1, normal: 2, bad: 3 }

  class << self
    # 購入者の評価
    def evaluation_bought_user!(evaluation_params, current_user, order)
      unless order.status == 'received'
        raise
      end

      evaluation = Evaluation.new(evaluation_params.merge(user_id: current_user.id, order_id: order.id, user: :bought_user))
      evaluation.point = Evaluation.point(evaluation.evaluation)

      order.status = :bought_user_evaluated

      transaction do
        evaluation.save!
        order.save!
      end
      
    end

    # 出品者の評価
    def evaluation_sold_user!(evaluation_params, current_user, order)
      unless order.status == "bought_user_evaluated"
        raise
      end

      evaluation = Evaluation.new(evaluation_params.merge(user_id: current_user.id, order_id: order.id, user: :sold_user))
      evaluation.point = Evaluation.point(evaluation.evaluation)

      order.status = :finished

      transaction do
        evaluation.save!
        order.save!
      end

    end

    # 評価ポイント計算
    def point(evaluation)
      if evaluation == "good"
        return 2
      elsif evaluation == "normal"
        return 1
      elsif evaluation == "bad"
        return -1
      end
    end

    # 購入者と出品者にポイント加算
    def evaluation_point(order_id)
      bought_user_evaluation = Evaluation.find_by(order_id: order_id, user: "bought_user")
      bought_user = User.find(bought_user_evaluation.user_id)
      bought_user.evaluation_point += bought_user_evaluation.point


      sold_user_evaluation = Evaluation.find_by(order_id: order_id, user: "sold_user")
      sold_user = User.find(sold_user_evaluation.user_id)
      sold_user.evaluation_point += sold_user_evaluation.point

      transaction do
        bought_user.save
        sold_user.save
      end

    end


  end  
end




    # def evaluation(evaluation, order)
    
    #   if order.status == 'received'
    #     # order.status.received?
    #     evaluation.order_id = order.id
    #     order.status = :evaluated
    #     evaluation.user = 'bought_user'
    #     evaluation.point = Evaluation.point(evaluation.evaluation)

    #   elsif order.status == 'evaluated'
    #     evaluation.order_id = order.id
    #     order.status = 'finished'
    #     evaluation.user = 'sold_user'
    #     evaluation.point = Evaluation.point(evaluation.evaluation)

    #   end
    #   ActiveRecord::Base.transaction do
    #     evaluation.save
    #     order.save

    #     if order.status == 'finished'
    #       Evaluation.evaluation_point(order.id)
    #     end

    #   end

    # end





      # class Order
      #   def evaluate_purchased_user!
      #     if !order.status.receieved?
      #       raise
      #     end

      #     evaluate = Evaluate.new(...)
      #     order.status = :evaluated
      #     transaction do
      #       evaluate.save!
      #       order.save!
      #     end
      #   end
