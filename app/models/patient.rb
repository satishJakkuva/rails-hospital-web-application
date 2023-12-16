class Patient
  include Mongoid::Document
  include Mongoid::Timestamps
  field :patient_name, type: String
  field :phone_number, type: String
  field :address, type: String
  field :gender, type: String
  field :email, type: String
  
  # validations
  validates :patient_name, presence: true
  validates :gender, inclusion: { in: %w(male female other), message: "gender must be male, female, or other" }
  validates :phone_number, length:{is:10}
  validates :address,presence:true

   has_many :appointments
   has_many :patient_medicines

  def doctors
    Doctor.in(id: appointments.pluck(:doctor_id))
  end
  def medicines_inventories
    MedicineInventory.in(id: patient_medicines.pluck(:medicine_inventory_id))
  end
  # has_many :doctors, through: :appointments
  # has_and_belongs_to_many :doctors
end
