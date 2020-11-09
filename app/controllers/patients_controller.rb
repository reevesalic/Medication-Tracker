# require 'pry'
class PatientsController < ApplicationController
before_action :set_patient, only: [:show, :edit, :update, :delete]

  def new
     @patient = Patient.new
  end

  def create
  # byebug
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def index

  end

  def update

  end

  def show

  end

  # def destroy
  #   @patient.destroy
  #   redirect_to_patients_path
 
  # end

  private

  def patient_params
    params.require(:patient).permit(:name, :frequency, quantity: [:name])
  end

  def set_patient
    @patient = Patient.find_by_id(params[:id])
    redirect_to patients_path if !@patient
  end

end
