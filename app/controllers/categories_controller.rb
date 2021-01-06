class CategoriesController < ApplicationController
     def show
          @category = Category.find(params[:id])
          @illness = Illness.find(params[:id])
     end

     def index
          @categories = Category.all
     end

     private
     def category_params
          params.require(:category).permit(:title, illnesses_attributes: [:id, :illness, :patient_id])
        end
end

