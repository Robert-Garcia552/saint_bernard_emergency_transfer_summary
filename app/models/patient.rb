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
    if self.dob.present?
      age = Date.today.year - self.dob.year
      age -= 1 if Date.today < self.dob.year + age.years
    else
      'DOB not reported'
    end
  end
end
