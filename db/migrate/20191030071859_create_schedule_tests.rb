class CreateScheduleTests < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_tests do |t|
      t.string :name
      t.datetime :date

      t.timestamps
    end
  end
end
