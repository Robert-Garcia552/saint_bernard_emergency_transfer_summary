class OrderFrequency < ApplicationRecord
  enum frequency_unit: ["hour"]

  belongs_to :medication_order

  def times
    "#{self.value} per #{self.frequency_unit}"
  end
end
