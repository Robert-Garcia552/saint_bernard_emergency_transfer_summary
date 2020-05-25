class EmergencyTransferSummaryController < ApplicationController

  def index
    @patients = Patient.all.order('last_name ASC')
  end

end