class BankAccountsController < ApplicationController
  def index
    @bank_accounts = Rails.cache.fetch("accounts", expires_in: 1.minute) {
      BankAccount.all.to_a
    }
    respond_to do |format|
      format.html
      format.json { render json: @bank_accounts }
    end
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
    @bank_account = BankAccount.get_bank_account(params[:id])
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(
      :name, :balance
    )
  end
end
