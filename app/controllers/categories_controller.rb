class CategoriesController < ApplicationController
     def show
          @category = Category.find(params[:id])
          @illness = Illness.find(params[:id])
     end

     def show
          @category = Category.all
     end
end
