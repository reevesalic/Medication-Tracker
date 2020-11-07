class PatientsController < ApplicationController

     def new
      @patient = Patient.new
     #  @patient.medication_build
end

def create
     
    
     @patient = Patient.new(patient_params)
     @patient.user_id = session[:user_id]
#      @patient.user_id = session[:user_id]

    if @patient.save! #this is where validations happen
#      #  @patient.image.purge
#      #  @patient.image.attach(params[:ice_cream][:image])
     #  redirect_to patient_path(@patient)
#     else
#      #  @patient.build_medication
      render :new
    end
  end

#   private

#   def patient_params
#     params.require(:patient).permit(:name, :frequency, quantity: [:name])
#   end

#   def set_ice_cream
#      @ice_cream = IceCream.find_by(params[:id])
#      redirect_to ice_creams_path if !@ice_cream
#   end

end
