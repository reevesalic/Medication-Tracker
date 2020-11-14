require 'pry'
class PatientsController < ApplicationController
before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def new
     @patient = Patient.new
     @patient.illnesses.build
  end

  def create
  
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def index
    @patients = Patient.all
  end

  def update
    @patient.update(patient_params)
    redirect_to patient_path(@patient)
  end

  def show
  
  end

  def destroy
    
    @patient.destroy
    redirect_to patients_path, notice: 'The patient was successfully deleted.'
  end

  private

  def patient_params
    params.require(:patient).permit(:name)
  end

  def set_patient
    @patient = Patient.find_by_id(params[:id])
    redirect_to patients_path if !@patient
  end

end
