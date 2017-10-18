class TransactionsController < ApplicationController
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

  def transaction_params
    params.require(:transaction).permit(
      :transaction_date, :transaction_amount, :budget_id, :note
    )
  end

end
