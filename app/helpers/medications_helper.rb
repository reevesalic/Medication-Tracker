module MedicationsHelper
     def medication_params
       params.require(:medication).permit(:name, :quantity, :frequency)
     end
   end
