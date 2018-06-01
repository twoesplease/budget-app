class UsersController < ApplicationController
  before_action :current_user, only: [:show, :create, :edit, :update]
  before_action :set_user, only: [:show, :edit, :destroy]

  def show
    if params[:slug].to_s.length <= 5
      redirect_to root_path 
      flash[:danger] = "Sorry, that wasn't an accessible page."
    else
      @user = User.find(params[:slug])
      @budgets = @user.budgets.paginate(page: params[:page], per_page: 5)
   end
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

  def edit
    @user = User.find(params[:slug])
  end

  def update
    @user = User.find(params[:slug])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :slug)
    end

    def set_user
      @user = User.find_by slug: params[:slug]
    end

end
