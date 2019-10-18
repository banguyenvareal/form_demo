class Changtype < ActiveRecord::Migration[6.0]
  def change
    change_column :bank_accounts, :balance, :integer
  end
end
