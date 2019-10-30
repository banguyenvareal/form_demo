class AddUserToScheduleTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedule_tests, :user, foreign_key: true
  end
end
