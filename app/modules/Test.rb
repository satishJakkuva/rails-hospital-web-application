module Test
    def Test.doctors_available(doctor,startdate,enddate)
        startdate=Date.parse(startdate)
        enddate=Date.parse(enddate)
        patients = []
        if doctor.nil?
           return patients
        else
            appointments = doctor.appointments
            appointments.each do |appointment|
                date = appointment.appointment_date
                if date.between?(startdate,enddate)
                    # patients << appointment.patient
                    patients << appointment
                    
                end
            end
        
             return patients
        end
    end

end