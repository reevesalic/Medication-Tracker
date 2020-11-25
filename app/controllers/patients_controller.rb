
class PatientsController < ApplicationController
  # before_action :set_medication
  # before_action :set_illness
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def new
    @patient = Patient.new
    @illness = @patient.illnesses.build
    @medication = @illness.build_medication
    @medications = Medication.all
  end

  def create
   
    @patient = current_user.patients.new(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      @medications = Medication.all
      render :new
    end
  end

  def index
    @patients = Patient.all
    if params[:q] #if search submitted
      @patients = @patients.search(params[:q]) #search thru collection of patients.
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    
    
    # @patient = Patient.find(params[:id])
    # @patient.update(patient_params)
    # redirect_to patient_path(@patient)
  end
  

  def show

  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private
  def patient_params
    params.require(:patient).permit(:name, illnesses_attributes: [:illness, :patient_id, :medication_id, medication_attributes: [:name, :frequency, :quantity]])
    # params.require(:patient).permit(:name, :id, illnesses_attributes: [:illness, medication_attributes: [:name, :frequency, :quantity]])
  end
  
  def set_patient
    @patient = Patient.find_by_id(params[:id])
    redirect_to patients_path if !@patient
  end

  # def set_illness
  #   @illness = Illness.find_by_id(params[:illness_id])
  #   redirect_to new_patient_path if !@illness
  # end

  # def set_medication
  #   @medication = Medication.find_by_id(params[:medication_id])
  #   redirect_to new_patient_path if !@medication
  # end
end