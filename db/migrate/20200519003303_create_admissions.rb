class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
      t.belongs_to :patient
      t.datetime :moment

      t.timestamps
    end
  end
end
