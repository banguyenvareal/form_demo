class BankAccount < ApplicationRecord
  belongs_to :user
  validates :name,  presence: true
  validates :balance, presence: true,
                       numericality: { greater_than_or_equal_to: 0 }

  def self.get_bank_account(id)
    cache_key = "bank_account/#{id}"
    bank_account = BankAccount.find_by(id: id)
    Rails.cache.write(cache_key, bank_account, expires_in: 15.minute) unless Rails.cache.exist?(cache_key)
    Rails.cache.read(cache_key)
  end
end
