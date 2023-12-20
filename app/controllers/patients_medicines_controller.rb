class PatientsMedicinesController < ApplicationController
  include MyModule
  def show
    render json: MyModule.method1
    render json: MyModule.method2
  end
end
