class Diagnosis < ApplicationRecord
  belongs_to :admission
  belongs_to :patient
end
