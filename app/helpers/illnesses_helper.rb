module IllnessesHelper
     def illness_params
       params.require(:illness).permit(:illness, :patient_id, :medication_id, :medication_params)
     end
     def find_illness
       @illness = Illness.find_by_id(params[:id])
       redirect_to patient_illnesses_path(@patient) if !@illness
     end
     def set_patient
       @patient = Patient.find_by_id(params[:patient_id])
       redirect_to patients_path if !@patient
     end
   end
