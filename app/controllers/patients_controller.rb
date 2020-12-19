
class PatientsController < ApplicationController
 
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
      redirect_to patient_path(@patient, @medication)
    else
      @medications = Medication.all
      render :new
    end
  end


  def index
    @patients = Patient.patient_meds
    if params[:q] #if search submitted
      @patients = @patients.search(params[:q]) #search thru collection of patients.
    end
  end

  def most_illnesses
    @patients = Patient.most_illnesses
  end
  
  def patient_meds
    @patients = Patient.patient_meds
    
  end

  def edit
    @patient = Patient.find(params[:id])
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
    params.require(:patient).permit(:name, illnesses_attributes: [:id, :illness, :patient_id, :medication_id, medication_attributes: [:id, :name, :frequency, :quantity]])
  end
  
  def set_patient
    @patient = Patient.find_by_id(params[:id])
    redirect_to patients_path if !@patient
  end

  
end