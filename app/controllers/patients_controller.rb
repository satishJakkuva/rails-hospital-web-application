class PatientsController < ApplicationController
  before_action :load_patient, only:[:show,:update]
  def index
    @patients=Patient.all
    render json:@patients
  end
  def doctors_by_patient
    @patient=Patient.find(params[:id])
    @doctors=@patient.doctors
    render json:{doctors_by_a_patient:@doctors,status:200}
  end
  def medicine_inventories_by_patient
    @patient=Patient.find(params[:id])
    @medicines_inventories=@patient.medicines_inventories
    render json:{medicines_of_a_patient:@medicines_inventories,status:200}
  end
  def patient_medicines_by_doctor
    @doctor=Doctor.find(params[:id])
    @patients=@doctor.patients
    patient_medicines=@patients.flat_map{ |patient| patient.medicines_inventories.only(:availability,:med_name,:qty)}
    # patient_medicines=@patients.flat_map{ |patient| patient.medicines_inventories.pluck(:availability,:med_name,:qty)}
    # patient_medicines=@patients.flat_map{ |patient| patient.medicines_inventories.map( |doc| doc.slice(:availability,:med_name,:qty))}
    render json:{ patient_medicines_by_a_doctor:patient_medicines,status:200}
  end
  def create
    patient=Patient.new(request_params)
    if patient.save
      render json: {message: "patient saved sucessfully",status:200}
    else
      render json: {message: "failed to insert patient"}
    end
  end

  def show
      render json:@patient,status:200
  end

  def update
      patient=Patient.update(phone_number:params[:phone_number])
      render json:{message:"patient details updated successfully",status:200}
  end
  def destroy
    Patient.destroy
    render json:{message:"patient destroyed successfully",status:200}
  end
  private
  def request_params
    params.require(:patient).permit(:patient_name,:phone_number,:address,:gender, :email)
  end
  def load_patient
    if params[:id].blank?
      render json:"patient id cannot be blank"
    else
        begin
           @patient=Patient.find(params[:id]) 
          rescue Mongoid::Errors::DocumentNotFound
           render json:{Errors:"patient id not found",status:404} 
          end
    end
  end
end
