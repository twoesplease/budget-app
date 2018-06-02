class BudgetsController < ApplicationController

  def show
    @budget = Budget.find(params[:id])
    @transactions = @budget.transactions.paginate(page: params[:page], per_page: 5)
  end

  def create
    @budget = Budget.new(budget_params) 
    @budget.user_slug = params[:user_slug]
    # @budget.goal_date = Date.parse(@budget[:goal_date])
    if @budget.save
      flash.now[:success] = 'Sweet! Budget saved.'
      redirect_to @budget
    else
      flash.now[:danger] = "Darn, that didn't work"
      render 'new'
    end
  end

  def new
    @budget = Budget.new
    @user =  User.find(params[:user_slug])
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :goal_total, :goal_date)
  end

end
