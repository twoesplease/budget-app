class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @budgets = Budget.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'Please try again.'
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
