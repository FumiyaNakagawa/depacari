class User::ProfilesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  def index
    
  end

  def edit
   @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(update_user_params)
      # flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render edit_user_profiles_path
    end
  end

  private

  def update_user_params
    params.require(:user).permit(:user_name, :email, :phone_number, :name, :address, :evaluation_point, :password, :introduction, :password_confirmation)
  end
end