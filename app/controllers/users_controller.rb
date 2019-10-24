class UsersController < ApplicationController
  def show
  end

  def withdraw
    bank_accounts = []
    account_ids = params[:account_ids]
    if account_ids
      account_ids.each do |id|
        bank_accounts << BankAccount.find_by(id: id)
      end
    else
      bank_accounts = current_user.bank_accounts
    end

    @result = WithdrawService.new(current_user).withdraw(params[:money].to_i, bank_accounts)
  end

  def new_withdraw
    @user = current_user
  end
end
