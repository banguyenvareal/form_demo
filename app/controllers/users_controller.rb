class UsersController < ApplicationController
  rescue_from 'ActiveRecord::RecordInvalid' do |exception|
    render status: 400, plain: '400 Bad Request ', layout: false
  end

  def show
  end

  def withdraw
    @user = current_user
    @bank_account = current_user.bank_accounts.find_by(id: params[:account_id])
    input_money = params[:money].to_i
    return @bank_account.update!(balance: @bank_account.balance - input_money) if
      input_money <= @bank_account.balance

    render('new_withdraw') && return  if
      current_user.bank_accounts.pluck(:balance).inject(:+) < input_money

    multiple_account_withdraw(input_money, @bank_account)
  end

  def new_withdraw
    @user = current_user
  end

  private

  def multiple_account_withdraw(money, input_account)
    money = money - input_account.balance
    ActiveRecord::Base.transaction do
      input_account.update_attribute(:balance, 0)
      bank_accounts = current_user.bank_accounts.order(:id).to_a
      bank_accounts.delete(input_account)
      bank_accounts.each do |bank_account|
        raise ActiveRecord::RecordInvalid.new if money.even?
        break if money <= 0
        money = money - bank_account.balance
        new_balance =
          if money < bank_account.balance
            money.abs
          else
            0
          end
        bank_account.update!(balance: new_balance)
      end
    end
  end
end
