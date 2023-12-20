class MedicinesInventoriesController < ApplicationController
  before_action :load_medicine, only: %i[show update destroy]
  # def index
  #   @medicine_inventories=MedicineInventory.all
  #   render json:@medicine_inventories
  # end
  def patients_by_medicine_inventory
    @medicine_inventory = MedicineInventory.find(params[:id])
    @patients = @medicine_inventory.patients
    render json: { patients_of_a_medicine: @patients, status: 200 }
  end

  def create
    @medicine_inventory = MedicineInventory.new(request_params)
    if @medicine_inventory.save
      render json: { message: 'medicine inventory created successfully', status: 200 }
    else
      render json: { errors: @medicine_inventory.errors.full_messages, status: 422 }
    end
  end

  def show
    render json: @medicine_inventory, status: 200
  end

  def update
    MedicineInventory.where(id: params[:id]).update(availability: params[:availability], med_name: params[:med_name],
                                                    qty: params[:qty])
    render json: { message: 'medicine details updated successfully', status: 200 }
  end

  def destroy
    @MedicineInventory.destroy
    render json: { message: 'medicine details destroyed successfully', status: 200 }
  end

  private

  def request_params
    params.require(:medicine_inventories).permit(:med_name, :qty, :availability)
  end

  def load_medicine
    if params[:id].blank?
      render json: { message: 'medicine id cannot be blank', status: 200 }
    else
      begin
        @medicine_inventory = MedicineInventory.find(params[:id])
      rescue Mongoid::Errors::DocumentNotFound
        render json: { message: 'medicine id not found', status: 404 }
      end
    end
  end
end
