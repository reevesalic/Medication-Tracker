class IllnessesController < ApplicationController
     
  before_action :set_illness, only: [:show, :edit, :update, :destroy]

  def new
    @illness = Illness.new
  end
    
  def create
    @illness = current_user.illnesses.build(illness_params)
    if @illness.save
      redirect_to patient_illness_path(@patient, @illness)
    else
      redirect_to new_patient_illness_path(@patient)
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
    @illness = Illness.find_by(id: params[:id])
    if @illness
    if current_user.id != @illness.user_id
      redirect_to patient_illnesses_path(session[:current_user])
    end
    else
      redirect_to patient_illness_path(@patient)
    end
  end

  def destroy
    @illness.destroy
    redirect_to patient_illnesses_path(@patient)
  end

  private

  def illness_params
    params.require(:illness).permit(:illness, :patient_id, :medication_id, medications_attributes: [:name, :frequency, :quantity])
  end

  def set_illness
    @illness = Illness.find_by_id(params[:id])
    redirect_to patient_illnesses_path(@patient) if !@illness
  end
end
