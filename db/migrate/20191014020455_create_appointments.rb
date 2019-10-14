class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.integer :duration

      t.timestamps
    end
  end
end
