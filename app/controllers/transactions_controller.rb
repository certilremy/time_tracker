class TransactionsController < ApplicationController
  before_action :require_user

  def index
    @transactions = current_user.transactions.order(created_at: :desc)
  end

  def new
    @transaction = Transaction.new
    @groups = Group.all
  end

  def create
    @transaction = Transaction.new(param_transaction)
    @transaction.user_id = current_user.id
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
    params.require(:transaction).permit(:name, :amoun, :user_id, :group_id)
  end
end
