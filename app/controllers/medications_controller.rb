class MedicationsController < ApplicationController

  # before_action :authenticate_user!
  
  def index
    @medications = current_user.medications.all
  end
  
  def new
    #check params to see if illness belongs to patient
    #if illness belongs to patient
    #then @illness = Illness.find_by(id:)
    if @illness = patient.illness
      @illness = Illness.find_by(id: params[:id])
      # binding.pry
  else
    @medication = Medication.new
    @medication.issue_medications.build
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
  
  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy
    redirect_to medications_path, notice: 'Your medication was successfully deleted.'
  end
  
  private
  
  def medication_params
    params.require(:medication).permit(
    :name,
    :quantity,
    :frequency
   )
  end
end
