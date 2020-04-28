class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :serial_number
      t.integer :device_status

      t.timestamps
    end
  end
end
