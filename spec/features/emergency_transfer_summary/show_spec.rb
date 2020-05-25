require 'rails_helper'

feature 'User views a patient\'s Emergency Transfer Summary' do
  scenario 'they should select a patient with no missing data and view the Emergency Transfer Summary' do
    patient = create(:patient)
    facility = create(:facility)
    admission = create(:admission, patient_id: patient.id)
    allergy = create(:allergy, patient_id: patient.id)
    diagnosis = create(:diagnosis, patient_id: patient.id, admission_id: admission.id)
    diagnostic_procedure = create(:diagnostic_procedure, patient_id: patient.id)
    medication_order = create(:medication_order, patient_id: patient.id)
    order_frequency = create(:order_frequency, medication_order_id: medication_order.id)
    observation = create(:observation, admission_id: admission.id)
    symptom = create(:symptom, admission_id: admission.id)
    treatment = create(:treatment, patient_id: patient.id)

    visit root_path
    find("a[href='#{emergency_transfer_summary_path(patient.id)}']").click
    find('.container')

    expect(page).to have_content facility.name
    expect(page).to have_content patient.first_name
    expect(page).to have_content patient.middle_name
    expect(page).to have_content patient.last_name
    expect(page).to have_content patient.mr
    expect(page).to have_content patient.age
    expect(page).to have_content patient.gender
    expect(page).to have_content date_sentence(patient.admission.moment)
    expect(page).to have_content patient.allergies.first.description
    expect(page).to have_content patient.admission.diagnoses.first.description
    expect(page).to have_content patient.admission.symptoms.first.description
    expect(page).to have_content patient.admission.observations.first.description.capitalize
    expect(page).to have_content patient.chronic_conditions.first.description
    expect(page).to have_content patient.medication_orders.first.name
    expect(page).to have_content patient.medication_orders.first.dosage
    expect(page).to have_content patient.medication_orders.first.mass_unit
    expect(page).to have_content patient.medication_orders.first.medication_route
    expect(page).to have_content patient.medication_orders.first.frequency.times
    expect(page).to have_content patient.medication_orders.first.necessity
    expect(page).to have_content patient.diagnostic_procedures.first.description
    expect(page).to have_content date_sentence(patient.diagnostic_procedures.first.moment)
    expect(page).to have_content patient.admission.diagnoses.first.description
    expect(page).to have_content patient.treatments.first.description
    expect(page).to have_content patient.treatments.first.necessity
    expect(page).to have_content 'Print Me'
  end

  scenario 'they should select a patient with missing data and view the Emergency Transfer Summary' do
    patient = create(:patient)
    facility = create(:facility)

    visit root_path
    find("a[href='#{emergency_transfer_summary_path(patient.id)}']").click
    find('.container')

    expect(page).to have_content facility.name
    expect(page).to have_content patient.first_name
    expect(page).to have_content patient.middle_name
    expect(page).to have_content patient.last_name
    expect(page).to have_content patient.mr
    expect(page).to have_content patient.age
    expect(page).to have_content patient.gender
    expect(page).to have_content 'Print Me'
  end

  def date_sentence(datetime)
    "on #{datetime.strftime('%B %d, %Y')} at #{datetime.strftime('%I:%M %p')}"
  end
end
