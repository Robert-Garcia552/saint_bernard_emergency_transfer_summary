class AddAdmissionAndPatientToDiagnoses < ActiveRecord::Migration[5.2]
  def change
    add_reference :diagnoses, :admission, index: true
    add_reference :diagnoses, :patient, index: true
  end
end
