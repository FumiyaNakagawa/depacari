class SessionsController < ApplicationController
  def new
    render layout: "no_search"
  end

  def create
    puts params[:email]
    # ログイン処理を書いてリダイレクトする
    user = User.find_by(email: params[:email].downcase)
    puts "start"
    puts params
    puts "end"
    if user && user.authenticate(params[:password])
      puts 'true'
      log_in user
      redirect_to user
    else
    # エラーメッセージを作成する
    flash.now[:danger] = 'ログインに失敗しました'
    puts 'false'
    render :new, layout: "no_search"
    end
  end
  
  def destroy

  end
end
