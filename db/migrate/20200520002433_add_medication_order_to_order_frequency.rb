class AddMedicationOrderToOrderFrequency < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_frequencies, :medication_order, index: true
    remove_column :medication_orders, :order_frequency_id
  end
end
