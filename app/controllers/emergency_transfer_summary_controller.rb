class EmergencyTransferSummaryController < ApplicationController
  def index
    @facility = Facility.find_by(name: 'Saint Bernard')
    @patients = Patient.all
  end

  def show
    facility = Facility.find_by(name: 'Saint Bernard')
    patient = Patient.find(params[:id])

    @summary = {
      "patient" => patient,
      "facility" => facility.name,
      "allergies_sentence" => to_sentence(patient&.allergies) || "no allergies reported",
      "chronic_conditions_sentence" => to_sentence(patient&.chronic_conditions) || "no chronic conditions reported",
      "medications" => medications(patient&.medication_orders) || "no medications reported",
      "treatment_sentence" => treatment_sentence(patient&.treatments) || "no treatment reported",
      "diagnostic_procedures_sentence" => diagnostic_procedures_sentence(patient&.diagnostic_procedures) || "no diagnostic procedures reported",
      "admission_date" => date_sentence(patient&.admission&.moment) || "no admission date or time provided",
      "symptoms_sentence" => to_sentence(patient&.admission&.symptoms) || "no symptoms reported",
      "diagnoses_sentence" => to_sentence(patient&.admission&.diagnoses) || "no diagnosis reported",
      "observations_sentence" => to_sentence(patient&.admission&.observations) || "No observations reported",
    }
  end

  def to_sentence(patient_attribute)
    attribute_descriptions = patient_attribute&.map{ |attribute| attribute&.description }
    attribute_descriptions.present? ? attribute_descriptions.join(', ') : false
  end

  def medications(patient_medication_orders)
    medication_orders_data = patient_medication_orders.map do |order| 
      "#{order&.name} #{order&.dosage} #{order&.mass_unit} #{order&.medication_route} #{order&.frequency&.times} to #{order&.necessity}"
    end
    medication_orders_data.present? ? medication_orders_data.join(', ') : false
  end

  def treatment_sentence(patient_treatments)
    treatment_data = patient_treatments.map{ |treatment| "#{treatment&.description} to #{treatment&.necessity}"}
    treatment_data.present? ? treatment_data.join(', ') : false
  end

  def diagnostic_procedures_sentence(patient_diagnostic_procedures)
    diagnostic_procedures_data = patient_diagnostic_procedures.map{ |procedure| "#{procedure&.description} #{date_sentence(procedure&.moment) || "no date provided"}" }
    diagnostic_procedures_data.present? ? diagnostic_procedures_data.join(', ') : false
  end

  def date_sentence(datetime)
    datetime.present? ? "on #{datetime&.strftime('%B %d, %Y')} at #{datetime&.strftime('%I:%M %p')}" : false
  end
end
