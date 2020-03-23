class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(param_transaction)
    # @transaction.user_id = User.last
    if @transaction.save
      redirect_to @transaction
    else
      render 'new'
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  private

  def param_transaction
    params.require(:transaction).permit(:name, :amoun, :user_id)
  end
end
