class BudgetsController < ApplicationController

  def show
    @budget = Budget.find(params[:id])
    @transactions = @budget.transactions.paginate(page: params[:page], per_page: 5)
  end

  def create
    @budget = Budget.new(budget_params) 
    @budget.goal_date = Date.parse(@budget[:goal_date])
    if @budget.save
      redirect_to @budget
    else
      render 'new'
    end
  end

  def new
    @budget = Budget.new
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :user_id, :goal_total, :goal_date)
  end
end
