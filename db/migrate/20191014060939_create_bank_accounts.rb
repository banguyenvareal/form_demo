class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.string :balance
      t.string :integer

      t.timestamps
    end
  end
end
