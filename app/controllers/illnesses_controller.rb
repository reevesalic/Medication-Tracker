class IllnessesController < ApplicationController
  before_action :set_patient
  before_action :find_illness, only: %I[show edit update destroy]
  def new
    @illness = @patient.illnesss.new
  end
  def create
    @illness = @patient.illnesss.new(illness_params)
    if @illness.save
      redirect_to patient_illness_path(@patient, @illness)
    else
      render :new
    end
  end
  def index
    @illnesss = illness.all
    redirect_to patient_path(@patient)
  end
  def show
    return unless verify
  end
  def update
    if !@illness
      render :new
    else
      @illness.update(illness_params)
      redirect_to patient_illness_path(@patient, @illness)
    end
  end
  def destroy
    @illness.destroy
    redirect_to patient_illnesss_path(@patient)
  end
end