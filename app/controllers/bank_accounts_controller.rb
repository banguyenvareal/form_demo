class BankAccountsController < ApplicationController
  def index
    @bank_accounts = current_user.bank_accounts if current_user
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = current_user.bank_accounts.new(bank_account_params)
    if @bank_account.save
      flash[:success] = 'You have created a new bank account'
      redirect_to bank_accounts_path
    else
      render 'new'
    end
  end

  def new_withdraw
    binding.pry
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(
      :name, :balance
    )
  end
end
