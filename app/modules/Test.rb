module Test
  def self.doctors_available(doctor, startdate, enddate)
    startdate = Date.parse(startdate)
    enddate = Date.parse(enddate)
    patients = []
    return patients if doctor.nil?

    appointments = doctor.appointments
    appointments.each do |appointment|
      date = appointment.appointment_date
      next unless date.between?(startdate, enddate)

      # patients << appointment.patient
      patients << appointment
    end

    patients
  end
end
