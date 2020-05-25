class DiagnosticProcedure < ApplicationRecord
  include Formatter

  belongs_to :patient
  before_create :remove_period
end
