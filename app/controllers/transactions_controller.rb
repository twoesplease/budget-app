class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.budget_id = params[:budget_id]
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
    @budget = Budget.find(params[:budget_id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :transaction_date, :transaction_amount, :note, :budget_id 
    )
  end

end
