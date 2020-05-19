class OrderFrequency < ApplicationRecord
  enum frequency_unit: ["hour"]
end
