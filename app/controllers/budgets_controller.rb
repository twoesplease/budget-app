class BudgetsController < ApplicationController
  def show
    @user = Budget.find(params[:id])
  end

  def create
     @budget = Budget.new(budget_params)
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
      params.require(:budget).permit(:user_id, :goal_total, :goal_date)
    end
end