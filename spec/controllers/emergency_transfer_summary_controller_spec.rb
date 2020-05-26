require 'rails_helper'

describe EmergencyTransferSummaryController do
  let!(:facility) { create(:facility, name: 'Saint Bernard') }

  it 'GET index' do
    get :index

    expect(@controller.view_assigns['facility'].name).to eq(facility.name)
  end

  it 'GET show' do
    patient = create(:patient)
    admission = create(:admission, patient_id: patient.id)
    allergy = create(:allergy, patient_id: patient.id)
    diagnosis = create(:diagnosis, patient_id: patient.id, admission_id: admission.id)
    diagnostic_procedure = create(:diagnostic_procedure, patient_id: patient.id)
    medication_order = create(:medication_order, patient_id: patient.id)
    order_frequency = create(:order_frequency, medication_order_id: medication_order.id)
    observation = create(:observation, admission_id: admission.id)
    symptom = create(:symptom, admission_id: admission.id)
    treatment = create(:treatment, patient_id: patient.id)
    summary = {
      'patient' => patient,
      'facility' => facility.name,
      'allergies_sentence' => patient.allergies.map{ |allergy| allergy.description }.join(', '),
      'chronic_conditions_sentence' => patient.chronic_conditions.map{ |condition| condition.description }.join(', '),
      'medications' => patient.medication_orders.map{ |order| "#{order.name} #{order.dosage} #{order.mass_unit} #{order.medication_route} #{order.frequency.times} to #{order.necessity}" }.join(', '),
      'treatment_sentence' => patient.treatments.map{ |treatment| "#{treatment.description} to #{treatment.necessity}" }.join(', '),
      'diagnostic_procedures_sentence' => patient.diagnostic_procedures.map{ |procedure| "#{procedure.description} on #{procedure.moment.strftime('%B %d, %Y')} at #{procedure.moment.strftime('%I:%M %p')}" }.join(', '),
      'admission_date' => "on #{admission.moment.strftime('%B %d, %Y')} at #{admission.moment.strftime('%I:%M %p')}",
      'symptoms_sentence' => patient.admission.symptoms.map{ |symptom| symptom.description }.join(', '),
      'diagnoses_sentence' => patient.admission.diagnoses.map{ |diagnosis| diagnosis.description }.join(', '),
      'observations_sentence' => patient.admission.observations.map{ |observation| observation.description }.join(', ')
    }
 
    get :show, params: { :id => patient.id }

    expect(@controller.view_assigns['summary']).to eq(summary)
  end
end