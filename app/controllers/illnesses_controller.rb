class IllnessesController < ApplicationController
     
     before_action :set_illness, only: [:show, :edit, :update, :destroy]

     def new
          @illness = Illness.new
     end
    
   
     def create
     
       @illness = current_user.illnesses.build(illness_params)
       if @illness.save
         
         redirect_to illness_path(@illness)
       else
         render :new
       end
     end
   
     def index
       @illnesses = Illness.all
     end
   
     def update
       @illness.update(illness_params)
       redirect_to illness_path(@illness)
     end
   
     def show
       @illness = Illness.find_by(id: params[:id])
       if @illness
         if current_user.id != @illness.user_id
           redirect_to illnesses_path(session[:current_user])
         end
       else
         redirect_to illnesses_path
       end
     end
   
     def destroy
       
       @illness.destroy
       redirect_to illnesses_path
     end
   
     private
   
     
   
     def illness_params
       params.require(:illness).permit(:illness)
     end
   
     def set_illness
       @illness = Illness.find_by_id(params[:id])
       redirect_to illnesses_path if !@patient
     end
   end
   
   

end
