class RemovePatientAndAdmissionFromDiagnosis < ActiveRecord::Migration[5.2]
  def change
    change_table :diagnoses do |t|
      t.remove_references :patient
      t.remove_references :admission
    end
  end
end
