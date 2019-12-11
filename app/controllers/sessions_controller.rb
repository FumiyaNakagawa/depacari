# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    render layout: 'no_search'
  end

  def create
    puts params[:email]
    # ログイン処理を書いてリダイレクトする
    user = User.find_by(email: params[:email].downcase)

    if user&.authenticate(params[:password])
      log_in user
      redirect_back_or user
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'ログインに失敗しました'
      puts 'false'
      render :new, layout: 'no_search'
    end
  end

  def destroy
    log_out
    redirect_to '/users'
  end
end
