class MedicineprescriptMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.medicineprescript_mailer.send_medicine_prescript.subject
  #
  def send_medicine_prescript(appointment)
    @appointment = appointment
    @patient = @appointment.patient
    puts "============================================"
    puts "patients: #{@patient.inspect}"
    @patient_medicines = @patient.patient_medicines.map { |patient_medicine| {
      # @pm = @patient.patient_medicines.map { |patient_medicine| {
      med_name: patient_medicine.medicine_inventory.med_name,
      qty: patient_medicine.medicine_inventory.qty
    }}
    puts "printing : #{@patient_medicines}"
    # mail(to: @patient.email, subject: 'Prescription Information')
    mail(from:'satishjakkuva123@gmail.com',to: 'jakkuvasatish7@gmail.com', subject: 'Prescription Information')
  end
end
