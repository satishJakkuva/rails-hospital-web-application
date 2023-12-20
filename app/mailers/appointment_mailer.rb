class AppointmentMailer < ApplicationMailer
  # include Sidekiq::Mailer
  default from: 'xuanle.khtn@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.welcome.subject
  #
  # def welcome
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end
  def send_appointment_confirmation(appointment)
    @appointment = appointment
    # mail(to: @appointment.patient.email, subject: 'Appointment Confirmation')
    attachments['JPA.pdf'] = File.read('/home/satishj/Downloads/JPA.pdf')
    attachments['HospitalImage.jpg'] = File.read('/home/satishj/Downloads/pexels-pixabay-263402.jpg')
    mail(to: ['jakkuvasatish7@gmail.com', 'c77023161@gmail.com', 'sanyasiraojakkuva123@gmail.com'],
         from: 'satishjakkuva123@gmail.com',
         subject: 'appointment confirmation')
  end
  # def send_appointment_update(appointment)
  #   previous_appointment_date = appointment.appointment_date_before_last_save
  #   @previous=previous_appointment_date
  #   @appointment=appointment
  #   mail(to:@appointment.patient.email,subject: 'Appointment update')
  # end
end
