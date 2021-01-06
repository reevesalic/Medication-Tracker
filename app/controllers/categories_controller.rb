class CategoriesController < ApplicationController

     def show
     @category = Category.find(params[:id])
     # @illnesses = illness.category(params[:category_id])
     @illness = Illness.find(params[:id])
     end

     def index
     
          @categories = Category.all
     
     # @categories = Category.category_illness
     end

     private
     def category_params
          params.require(:category).permit(:title, illnesses_attributes: [:id, :illness, :patient_id])
        end
end