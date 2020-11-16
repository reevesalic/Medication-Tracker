require 'pry'
class PatientsController < ApplicationController
before_action :set_patient, only: [:show, :edit, :update, :delete]
  def new
   @patient = Patient.new
   @illness = @patient.illnesses.build
   @medication = @illness.build_medication
   @medications = Medication.all
  end
  def create
    # binding.pry
    @patient = current_user.patients.new(patient_params)
    # binding.pry
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end
  def index
    Patient.all
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
    params.require(:patient).permit(:name, illnesses_attributes: [:illness, :medication_id, medications_attributes: [:name, :frequency, :quantity]])
  end
  # , medication_attributes: [:name, :quantity, :frequency]
  def set_patient
    @patient = Patient.find_by_id(params[:id])
    redirect_to patients_path if !@patient
  end
end