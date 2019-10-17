class UsersController < ApplicationController
  # before_acton :assing_user, only: %i[show new_withdraw]

  def show
  end

  def withdraw
    binding.pry
  end

  def new_withdraw
    @user = current_user
  end
end
