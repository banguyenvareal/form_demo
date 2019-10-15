class AddNameUserIndexToBankAccount < ActiveRecord::Migration[6.0]
  def change
    add_index :bank_accounts, [:name, :user_id], unique: true
  end
end
