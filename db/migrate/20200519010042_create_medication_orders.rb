class CreateMedicationOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_orders do |t|
      t.belongs_to :patient
      
      t.string :name
      t.integer :mass_unit
      t.decimal :dosage
      t.integer :medication_route
      t.references :order_frequency, foreign_key: true
      t.text :necessity

      t.timestamps
    end
  end
end
