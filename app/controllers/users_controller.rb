class UsersController < ApplicationController
  # before_acton :assing_user, only: %i[show new_withdraw]

  def show
  end

  def withdraw
    binding.pry
    @result=current_user.bank_accounts.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @test}
    end
  end

  def new_withdraw
    @user = current_user
  end
end
