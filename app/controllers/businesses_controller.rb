class BusinessesController < ApplicationController
   def index
    @nightclubs= Business.where(category: "clubs")
    @bars= Business.where(category: "bars")
    @rests= Business.where(category: "restaurants")
   end

   def show
      @business = Business.find(params[:id])
      @review = Review.new
      @rsvp = Rsvp.new
      @party_time = PartyTime.new
   end

    def area 
     @areas = ["Dumbo", "Williamsburg", "Sheepshead Bay", "Bushwick"] 
    end

    def set_area
    session[:area] = params[:area][:area]
    redirect_to businesses_path
    # byebug
    end
end
