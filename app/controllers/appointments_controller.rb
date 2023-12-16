class AppointmentsController < ApplicationController
  before_action :load_appointment, only:[:show,:update,:destroy]
  # def index
  #   @appointments=Appointment.all
  #   render json:@appointments
  # end

  def create
    @appointment=Appointment.new(request_params)
    if @appointment.save
      puts "before sending email"
      # AppointmentMailer.send_appointment_confirmation(@appointment).deliver_now
      puts "email sent"
      render json: {message: "appointments saved sucessfully",status:200}
    else
      render json: {message: "failed to insert appointments"}
    end
  end

  def show
      render json:@appointment,status:200
  end
  def update
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.update(appointment_date: params[:appointment_date])
      @appointment.reload
      # AppointmentMailer.send_appointment_update(@appointment).deliver_now
      render json: { message: "Appointment details updated successfully", status: 200 }
    else
      render json: { message: "Failed to update appointment details", status: 500 }
    end
  end
  def appointment_completion
    @appointment = Appointment.find(params[:id])
    @date_difference = @appointment.appointment_date - Date.today  
    if (@date_difference<0)
      if @appointment.patient.patient_medicines.empty?      
        render json: "no medicines were prescripted to the patient"
      else   
      MedicineprescriptMailer.send_medicine_prescript(@appointment).deliver_now
      render json:"appointment is finished.Sent a medicine prescript through mail"
      end
    else
      render json:"appointment is scheduled on #{@appointment.appointment_date}"
    end
  end
  
  def destroy
      @appointment.destroy
      render json: { message: "Appointment destroyed successfully", status: 200 }
  end
  # def send_confirmation_email
  #   appointment = Appointment.find(params[:id])
    # render 'appointments/email_confirmation', locals: { appointment: appointment }
  # render json: 'Email sent successfully!'
  # end
  private
  def request_params
    params.require(:appointment).permit(:clinic_name,:clinic_place,:appointment_date,:patient_id,:doctor_id)
  end
  def load_appointment
    if params[:id].blank?
      render json: { message: "Appointment ID cannot be blank", status: 400 }
    else
      begin
        @appointment = Appointment.find(params[:id])
      rescue Mongoid::Errors::DocumentNotFound
        render json: { message: "Invalid appointment ID", status: 404 }
      end
    end
  end
end
