class EmergencyTransferSummaryController < ApplicationController

  def index
    @facility = Facility.find_by(name: 'Saint Bernard')
    @patients = Patient.all.order('last_name ASC')
  end

  def show
    @facility = Facility.find_by(name: 'Saint Bernard').name
    @patient = Patient.find(params[:id])
  end
end
