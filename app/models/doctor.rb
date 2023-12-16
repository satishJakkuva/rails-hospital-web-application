class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps
  include Test
  field :name, type: String
  field :specialisation, type: String
  field :email, type:String
  # validations
  validates :name, presence: true
  validates :specialisation, presence:true
  
 
  has_many :appointments

  def patients
    Patient.in(id: appointments.pluck(:patient_id))
  end
  def self.print
    puts "hi my name is satish"
  end
  # has_many :patients, through: :appointments
  # has_and_belongs_to_many :patients
end
