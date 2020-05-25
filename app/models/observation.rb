class Observation < ApplicationRecord
  include Formatter

  belongs_to :admission
  before_create :remove_period
end
