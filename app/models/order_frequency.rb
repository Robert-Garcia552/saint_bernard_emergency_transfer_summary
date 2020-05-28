class OrderFrequency < ApplicationRecord
  enum frequency_unit: ["hour"]

  belongs_to :medication_order
end
