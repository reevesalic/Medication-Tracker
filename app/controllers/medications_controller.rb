class MedicationsController < ApplicationController
  before_action :set_illness
  before_action :find_medication, only: %I[show edit update destroy]
  def new
    @medication = @illness.medications.new
  end
  def create
    @medication = @illness.medications.new(medication_params)
    if @medication.save
      redirect_to illness_medication_path(@illness, @medication)
    else
      render :new
    end
  end
  def index
    @medications = medication.all
    redirect_to illness_path(@illness)
  end
  def show
    return unless verify
  end
  def update
    if !@medication
      render :new
    else
      @medication.update(medication_params)
      redirect_to illness_medication_path(@illness, @medication)
    end
  end
  def destroy
    @medication.destroy
    redirect_to illness_medications_path(@illness)
  end
end