
class EvaluationService < BaseService

  # 購入者の評価
  def evaluation_bought_user!(evaluation_params, current_user, order)
    unless order.status == 'received'
      raise
    end

    evaluation = Evaluation.new(evaluation_params.merge(user_id: current_user.id, order_id: order.id, user: :bought_user))
    evaluation.point = Evaluation.point(evaluation.evaluation)

    order.status = :bought_user_evaluated

    ActiveRecord::Base.transaction do
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

    ActiveRecord::Base.transaction do
      evaluation.save!
      order.save!
      # 購入者と出品者の評価ポイントを加算する
      evaluation_point(order.id)
    end

  end

  private

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

    bought_user.save
    sold_user.save

  end

end
