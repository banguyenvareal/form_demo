class BankAccountsController < ApplicationController
  def index
    @bank_accounts = current_user.bank_accounts if current_user
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = current_user.bank_accounts.new(bank_account_params)
    render js: "alert('The number is: #{params}')"
    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to bank_accounts_path, notice: 'bank_account was successfully created.' }
      else
        format.html { render :new, notice: 'error' }
      end
    end
  end



  def show
    # @bank_account = current_user.bank_accounts.find_by(id: params[:id])
    #   render js: "alert('The number is: #{params[:id]}')"
  end

  def update

  end

  private

  def bank_account_params
    params.require(:bank_account).permit(
      :name, :balance
    )
  end
end
