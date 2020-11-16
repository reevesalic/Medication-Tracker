require 'pry'
class PatientsController < ApplicationController
before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def new
     @patient = Patient.new
     @illness = @patient.illnesses.build
  end

  def create
  
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      # @illness = @patient.illnesses.create(illness_params)
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
    redirect_to patients_path(session[:current_user])
  end

  def show
    @patient = Patient.find_by(id: params[:id])
    if @patient
      if current_user.id != @patient.user_id
        redirect_to patients_path(session[:current_user])
      end
    else
      redirect_to patients_path
    end
  end

  def destroy
    
    @patient.destroy
    redirect_to patients_path, notice: 'The patient was successfully deleted.'
  end

  private

  def patient_params
    params.require(:patient).permit(:name)
      # , illnesses_attributes: [:illness])
  end

  def illness_params
    params.require(:illness).permit(:illness)
  end

  def set_patient
    @patient = Patient.find_by_id(params[:id])
    redirect_to patients_path if !@patient
  end
end

