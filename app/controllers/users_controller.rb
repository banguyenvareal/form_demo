class UsersController < ApplicationController
  def show
  end

  def withdraw
    @user = current_user
    money = params[:money].to_i
    render('new_withdraw') && return  if
      current_user.bank_accounts.pluck(:balance).inject(:+) < money

    ActiveRecord::Base.transaction do
      n = 0
      bank_accounts = current_user.bank_accounts.order(:id).to_a
      while money > 0
        bank_account = bank_accounts[n]
        diff_money = bank_account.balance - money
        if diff_money < 0
          n = n + 1
          money = diff_money.abs
          bank_account.update(balance: 0)
        else
          bank_account.update(balance: diff_money)
          money = 0
        end
      end
    end
  end

  def new_withdraw
    @user = current_user
  end
end
