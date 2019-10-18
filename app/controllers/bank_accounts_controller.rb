class BankAccountsController < ApplicationController
  def index
    @bank_accounts = current_user.bank_accounts if current_user
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = current_user.bank_accounts.new(bank_account_params)
    @bank_account.save
    redirect_to root_path
  end

  def show
    # @bank_account = current_user.bank_accounts.find_by(id: params[:id])
    #   render js: "alert('The number is: #{params[:id]}')"
  end

  def update

  end

  private

  def bank_account_params
    params.require(:bank_account).permit(
      :name, :balance
    )
  end
end
