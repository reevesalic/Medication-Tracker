class IllnessesController < ApplicationController
  include ApplicationHelper  
  before_action :set_illness, only: [:show, :edit, :update, :destroy]
  before_action :set_patient
  def new
    if params[:patient_id]
      @patient = Patient.find_by(id: params[:patient_id])
      @illness = @patient.illnesses.build
      @illness.build_medication
    else
      @medication = Medication.new
      @medication.patient_medications.build
      render :new
  end
end
    
  def create
    binding.pry
    @illness = @patient.illnesses.new(illness_params)
    if @illness.save
      redirect_to patient_illnesses_path(@patient, @illness, @medication)
    else
      render :new
    end
  end

  def index
    @illnesses = Illness.all
  end

  def update
    @illness.update(illness_params)
    redirect_to patient_illness_path(@patient, @illness)
  end

  def show
    if !logged_in?
      redirect_to login_path
    else
      redirect_to patient_illness_path(@patient, @illness)
    end
  end

  def destroy
    @illness.destroy
    redirect_to patient_illnesses_path(@patient)
  end

  private

  def illness_params
    params.require(:illness).permit(:illness, :patient_id, :medication_id, medication_attributes: [:name, :frequency, :quantity])
  end

  def set_illness
    @illness = Illness.find_by_id(params[:id])
    redirect_to patient_illnesses_path(@patient) if !@illness
  end

  def set_patient
    @patient = Patient.find_by_id(params[:patient_id])
    redirect_to patients_path if !@patient
  end

end
