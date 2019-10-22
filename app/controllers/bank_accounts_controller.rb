class BankAccountsController < ApplicationController
  def index
    @bank_accounts = current_user.bank_accounts if current_user
    render json: {results: @bank_accounts } if request.xhr?
    # respond_to do |format|
    #   format.html {}

    # end
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = current_user.bank_accounts.new(bank_account_params)
    @bank_account.save
    redirect_to root_path
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(
      :name, :balance
    )
  end
end
