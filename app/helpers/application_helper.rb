module ApplicationHelper
 
  def logged_in?
    !!current_user
  end
  def verify
    redirect_to login_path unless logged_in?
  end

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

  def medication_params
    params.require(:medication).permit(:name, :quantity, :frequency)
  end

    
  def find_patient
    @patient = Patient.find_by_id(params[:id])
    redirect_to patients_path if !@patient
  end

  def patient_params
    params.require(:patient).permit(:name, :user_id)
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
end
