module EmergencyTransferSummaryHelper
  def to_sentence(patient_attribute, attribute_name)
    attribute_descriptions = patient_attribute&.map do |attribute|
      description = attribute.description&.downcase&.tr('.', '')
      if attribute.has_attribute?(:necessity) && attribute.necessity.present?
        necessity = "to #{attribute.necessity&.downcase&.tr('.', '')}"
      end
      moment = date_sentence(attribute.moment) if attribute.has_attribute?(:moment)
      sentence = "#{description} #{necessity || ""} #{moment}"
      sentence.strip
    end
    attribute_descriptions.all?(&:present?) ? attribute_descriptions.join(', ') : "no #{attribute_name} reported"
  end

  def date_sentence(moment)
    moment.present? ? "on #{moment.strftime('%B %d, %Y')} at #{moment.strftime('%I:%M %p')}" : "no date or time reported"
  end

  def medications(patient_medication_orders)
    medication_orders_data = patient_medication_orders.map do |order|
      "#{order&.name} #{order&.dosage} #{order&.mass_unit} #{order&.medication_route} #{order&.frequency&.value} 
        #{order&.frequency&.frequency_unit.present? ? "per" + order&.frequency&.frequency_unit : ""} 
        #{order.necessity.present? ? "to" + order.necessity : ""}"
    end
    medication_orders_data.all?(&:present?) ? medication_orders_data.join(', ') : "no medication orders reported"
  end
end
