module PatientsHelper
     def patient_params
       params.require(:patient).permit(:name, :illness_params)
     end
     def find_patient
       @patient = Patient.find_by_id(params[:id])
       redirect_to patients_path if !@patient
     end
   end
