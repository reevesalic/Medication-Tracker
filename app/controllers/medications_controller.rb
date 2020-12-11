class MedicationsController < ApplicationController

  def index
    @medications = current_user.medications.all
  end
  
  def new
    if params[:patient_id]
      @patient = Patient.find_by(id: params[:patient_id])
      @illness = @patient.illnesses
    else
      @medication = Medication.new
      @medication.patient_medications.build
      render :new
    end
  end

  def create
    # binding.pry
    @medication = Medication.new(medication_params)
   
    if @medication.save
      redirect_to patient_medications_path(@medication), notice: 'Your medication was successfully created.'
    else
      render :new
    end
  end
  
  def index
    @patients = Patient.all
  end

  def edit
    @medication = Medication.find(params[:id])
  end

  def update
    @medication = Medication.find(params[:id])
    
    @medication.update(medication_params)
    redirect_to medication_path(@medication)
  end
  
  def show

  end

  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy
    redirect_to medications_path, notice: 'Your medication was successfully deleted.'
  end
  
  private
  
  def medication_params
    params.require(:medication).permit(:name, :quantity, :frequency)
  end
end
