class HospitalsController < ApplicationController

     def show
          @hospital = Hospital.find(params[:id])
          # @patient = Patient.find(params[:id])
     end

def index
  @hospitals = Hospital.all
end

end