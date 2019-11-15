class RsvpsController < ApplicationController
   def new
    @rsvp = Rsvp.new
   end

   def create
  #  byebug
     strong_params = params.require(:rsvp).permit(:party_time_id,:user_id)
     @new_rsvp = Rsvp.create(strong_params)
     redirect_to @new_rsvp.user
   end

   def destroy
      @rsvp = Rsvp.find(params[:id])
      @rsvp.destroy
      redirect_to @current_user
     end
end
