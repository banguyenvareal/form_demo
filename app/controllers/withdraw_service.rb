class WithdrawService
  def initialize(user)
    @user = user
  end

  def withdraw(money, bank_accounts)
    total_money = bank_accounts.pluck(:balance).sum
    return result = OpenStruct.new(status: 'fail') if
      total_money < money

    ActiveRecord::Base.transaction do
      n = 0
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
       result = OpenStruct.new(status: 'success', data: @user.bank_accounts)
    end
  end
end
