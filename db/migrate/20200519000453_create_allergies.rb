class CreateAllergies < ActiveRecord::Migration[5.2]
  def change
    create_table :allergies do |t|
      t.belongs_to :patient
      t.text :description

      t.timestamps
    end
  end
end
