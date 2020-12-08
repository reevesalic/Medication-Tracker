class MedicationsController < ApplicationController

  # before_action :authenticate_user!
  

  def index
    @medications = current_user.medications.all
  end
  
  def new
    if params[:patient_id]
      @patient = Patient.find_by(id: params[:patient_id])
    else
      @medication = Medication.new
      @medication.patient_medications.build
      render :new
  end
end

  def create
    @medication = Medication.new(medication_params)
    @medication.user = current_user
    if @medication.save
      redirect_to medications_path, notice: 'Your medication was successfully created.'
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
    params.require(:medication).permit(:name, :quantity,
    :frequency
   )
  end
end
