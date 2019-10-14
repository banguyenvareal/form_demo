class CreatePhysicals < ActiveRecord::Migration[6.0]
  def change
    create_table :physicals do |t|
      t.string :name
      t.string :major

      t.timestamps
    end
  end
end
