class TransactionsController < ApplicationController
  # before_action :set_budget_id, only: [:new, :create]

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      flash.now[:success] = 'Yeah! Transaction saved.'
     render 'success'
    else
      flash.now[:danger] = "Uh oh, something isn't right"
     render 'new'
    end
  end

  def new
    @transaction = Transaction.new
  end

  private

  # def set_budget_id
    # @budget = Budget.find(params[:id])
  # end

  def transaction_params
    params.require(:transaction).permit(
      :transaction_date, :transaction_amount, :note, :budget_id 
    )
  end

end
