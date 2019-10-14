class UsersController < ApplicationController
  # before_acton :assing_user, only: %i[show new_withdraw]

  def show
  end

  def withdraw
    user = current_user
    # respond_to do |f|
    #   f.html { redirect_to withdraw_user(current_user) }
    #   f.js
    # end
  end
end
