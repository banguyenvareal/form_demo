class UsersController < ApplicationController
  def show
  end

  def withdraw
    @result = WithdrawService.new(current_user).withdraw(params[:money].to_i)
  end

  def new_withdraw
    @user = current_user
  end
end
