class EmergencyTransferSummaryController < ApplicationController
  def index
    @facility = Facility.find_by(name: 'Saint Bernard')
    @patients = Patient.all
  end

  def show
    @facility = Facility.find_by(name: 'Saint Bernard')
    @patient = Patient.find(params[:id])

    @summary = {
      "patient" => @patient,
      "facility" => @facility,
      "allergies_sentence" => allergies_sentence,
      "chronic_conditions_sentence" => chronic_conditions_sentence,
      "medications" => medications,
      "treatment_sentence" => treatment_sentence,
      "diagnostic_procedures_sentence" => diagnostic_procedures_sentence,
      "admission_date" => admission_date,
      "symptoms_sentence" => symptoms_sentence,
      "diagnoses_sentence" => diagnoses_sentence,
      "observations_sentence" => observations_sentence,
    }
  end

  def allergies_sentence
    allergy_descriptions = @patient.allergies.map{ |allergy| allergy.description.tr('.', '') }
    allergy_descriptions.join(', ')
  end

  def chronic_conditions_sentence
    chronic_conditions_descriptions = @patient.chronic_conditions.map{ |condition| condition.description.tr('.', '') }
    chronic_conditions_descriptions.join(', ')
  end

  def medications
    medication_orders_data = @patient.medication_orders.map do |order| 
      "#{order.name} #{order.dosage} #{order.mass_unit} #{order.medication_route} #{order.frequency.times} to #{order.necessity.tr('.', '')}"
    end
    medication_orders_data.join(', ')
  end

  def treatment_sentence
    treatment_data = @patient.treatments.map{ |treatment| "#{treatment.description.tr('.', '')} to #{treatment.necessity.tr('.', '')}"}
    treatment_data.join(', ')
  end

  def diagnostic_procedures_sentence
    diagnostic_procedures_data = @patient.diagnostic_procedures.map{ |procedure| "#{procedure.description.tr('.', '')} #{date_sentence(procedure.moment)}" }
    diagnostic_procedures_data.join(', ')
  end

  def admission_date
    date_sentence(@patient.admission.moment)
  end

  def diagnoses_sentence
    diagnosis_descriptions = @patient.admission.diagnoses.map{ |diagnosis| diagnosis.description.tr('.', '') }
    diagnosis_descriptions.join(', ')
  end

  def symptoms_sentence
    symptoms_descriptions = @patient.admission.symptoms.map{ |symptom| symptom.description.tr('.', '') }
    symptoms_descriptions.join(', ')
  end

  def observations_sentence
    observations_descriptions = @patient.admission.observations.map{ |observation| observation.description.capitalize.tr('.', '') }
    observations_descriptions.join(', ')
  end

  def date_sentence(datetime)
    "on #{datetime.strftime('%B %d, %Y')} at #{datetime.strftime('%I:%M %p')}"
  end
end
