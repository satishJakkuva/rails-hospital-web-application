class MedicineInventory
  include Mongoid::Document
  include Mongoid::Timestamps
  field :med_name, type: String
  field :qty, type: Integer
  field :availability, type: String

  # validations
  validates :availability, inclusion: { in: %w[yes no], message: 'availability must be either yes or no' }

  has_many :patient_medicines

  def patients
    Patient.in(id: patient_medicines.pluck(:patient_id))
  end
end
