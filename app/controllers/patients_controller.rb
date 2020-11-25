
class PatientsController < ApplicationController
 
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def new
    # binding.pry
    @patient = Patient.new
  end
  def create
    @patient = Patient.new(patient_params)
    # binding.pry
   
    @patient = current_user.patients.new(patient_params)
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
    
    
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
    redirect_to patient_path(@patient)
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
    
  end
  
  def set_patient
    @patient = Patient.find_by_id(params[:id])
    redirect_to patients_path if !@patient
  end

  
end