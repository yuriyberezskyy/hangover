class BusinessesController < ApplicationController
   def index
    @nightclubs= Business.where(category: "clubs")
    @bars= Business.where(category: "bars")
    @rests= Business.where(category: "restaurants")
   end

   def show
      @business = Business.find(params[:id])
   end
end
