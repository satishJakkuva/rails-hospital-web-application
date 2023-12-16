namespace :doctors do
  desc "get all doctors"
  task get_doctors: :environment do
    doctors = Doctor.all 
    for doctor in doctors 
      puts "#{doctor.name} - #{doctor.email}"
    end
  end
  task get_doctor_by_id: :environment do
     doctor=Doctor.where(id:"6571f5434d6a8412cf25ce4b")
     for doc in doctor 
      puts "#{doc.name} - #{doc.email}"
    end
  end
  task update_by_id: :environment do
    str="6571f5434d6a8412cf25ce4b"
    if str.blank?
      puts "doctor id cannot be blank"
    else
       doctor=Doctor.where(id:str)
       if doctor.exists?(doctor)
         doctor.update(name:"satish")
         puts "doctor details updated successfully"
       else
        puts "doctor id not found"
       end
    end
  end

end