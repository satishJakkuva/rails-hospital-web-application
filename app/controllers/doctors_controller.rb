class DoctorsController < ApplicationController
  include Test
  before_action :load_doctor, only: %i[show update destroy]
  def index
    # @doctors = Doctor.all.map { |doc| doc.slice(:name, :specialisation, :email) } # array of hashes
    # @doctors = Doctor.all.pluck(:name)
    # @doctors = Doctor.all.map {|doc| puts "name:#{doc.name},specialisation: #{doc.specialisation}"}
    # @doctors=Doctor.all.pluck(:doctor_id,:name,:specialisation)   #array of values
    # @doctors=Doctor.all.only(:doctor_id,:name,:specialisation)      #array of hashes including id
    @doctors=Doctor.all.map { |doctor|
    {
    doctor_name: doctor.name,
     specialisation: doctor.specialisation
  }
    
  }
    render json: @doctors
  end

  def create
    @doctor = Doctor.new(request_params)
    if @doctor.save
      render json: { message: 'doctor saved sucessfully', status: 200 }
    else
      render json: { message: 'failed to insert doctor' }
    end
  end

  def patients_by_doctor
    @doctor = Doctor.find(params[:id])
    @patients = @doctor.patients
    render json: { patients_by_a_doctor: @patients, status: 200 }
  end

  def show
    render json: @doctor, status: 200
  end

  def update
    @doctor.update(name: params[:name], specialisation: params[:specialisation])
    render json: 'doctor details updated succesfully'
  end

  def destroy
    @doctor.destroy
    render json: 'destroyed doctor succesfully'
  end

  def show
    patients = Test.doctors_available(@doctor, params[:startdate], params[:enddate])
    if patients.empty?
      render json: { "message": 'doctor is unavailable' }
    else
      # render json:patients.to_json(only:[:name,:specialisation,:email])
      render json: patients
    end
  end

  private

  def request_params
    params.require(:doctor).permit(%i[name specialisation email])
  end

  def load_doctor
    if params[:id].blank?
      render json: 'doctor id cannot be blank'
    else
      begin
        @doctor = Doctor.find(params[:id])
      rescue Mongoid::Errors::DocumentNotFound
        render json: { Errors: 'doctor id not found', status: 404 }
      end
    end
  end
end
