class Patient < ApplicationRecord
  enum gender: ["male", "female", "other"]
  
  has_one :admission
  has_many :allergies
  has_many :chronic_conditions, class_name: 'Diagnosis'
  has_many :diagnostic_procedures
  has_many :diagnoses
  has_many :treatments
  has_many :medication_orders

  def full_name
    "#{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def age
    DateTime.now.strftime('%Y').to_i - self.dob.strftime('%Y').to_i
  end
end
