class ChangeDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :schedule_tests, :date, :string
  end
end
