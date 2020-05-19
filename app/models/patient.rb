class Patient < ApplicationRecord
  enum gender: ["male", "female", "other"]
  
  has_many :admissions
  has_many :allergies
  has_many :chronic_conditions, class_name: 'Diagnoses'
  has_many :diagnostic_procedures
  has_many :diagnoses
  has_many :treatments
end
