class PatientMedicine
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :patient
  belongs_to :medicine_inventory
end
