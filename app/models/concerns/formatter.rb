module Formatter
  extend ActiveSupport::Concern

  included do
    def remove_period
      if self.has_attribute?(:description)
        self.description = self&.description&.downcase&.tr('.', '')
      end
      if self.has_attribute?(:necessity)
        self.necessity = self&.necessity&.downcase&.tr('.', '')
      end
    end
  end
end