class EmergencyTransferSummaryController < ApplicationController

  def index
    @patients = Patient.all
  end
  
end
