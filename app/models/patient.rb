class Patient < ApplicationRecord
  enum gender: ["male", "female", "other"]
  
  has_many :admissions
  has_many :allergies
  has_many :chronic_conditions, class_name: 'Diagnoses'
  has_many :diagnostic_procedures
  has_many :diagnoses
  has_many :treatments

  def full_name
    "#{self.first_name} #{self.middle_name} #{self.last_name}"
  end
end
