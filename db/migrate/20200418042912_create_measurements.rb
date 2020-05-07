class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.references :device, null: false, foreign_key: true
      t.decimal :value, precision: 5, scale: 2
      t.integer :measurement_unit
      t.integer :measurement_type

      t.timestamps
    end
  end
end
