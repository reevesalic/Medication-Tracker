
class PatientsController < ApplicationController
  include ApplicationHelper
  before_action :find_patient, only: %I[show edit update destroy]
  def new
    # binding.pry
    @patient = Patient.new
  end
  def create
    @patient = Patient.new(patient_params)
    # binding.pry
    if @patient.save
      
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end
  def index
    @patients = Patient.all
    @medications = Medication.all
    @illnesses = Illness.all
  end
  def show
    return unless verify
  end
  def update
    if !@patient
      render :new
    else
      @patient.update(patient_params)
      redirect_to patient_path(@patient)
    end
  end
  def destroy
    @patient.destroy
    redirect_to patients_path
  end
end