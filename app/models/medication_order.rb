class MedicationOrder < ApplicationRecord
  enum mass_unit: ["mg"]
  enum medication_route: ["PO", "IM", "SC"]

  belongs_to :patient
  has_one :frequency, class_name: 'OrderFrequency'
end
