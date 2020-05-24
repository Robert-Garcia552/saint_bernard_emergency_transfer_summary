class Diagnosis < ApplicationRecord
  include Formatter

  belongs_to :admission
  belongs_to :patient
  before_create :remove_period
end
