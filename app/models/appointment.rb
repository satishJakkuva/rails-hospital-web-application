class Appointment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :clinic_name, type: String
  field :clinic_place, type: String
  field :appointment_date, type: Date
  # field :doctor_id, type: BSON::ObjectId
  # field :patient_id, type: BSON::ObjectId
  belongs_to :doctor
  belongs_to :patient

  # belongs_to :doctor # class_name:'Doctor', foreign_key: 'doctor_id'
  # belongs_to :patient #class_name:'Patient', foreign_key: 'patient_id'
end
