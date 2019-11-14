class PartyTimesController < ApplicationController
    def new
      @party_time = PartyTime.new
    end

    def create
    # byebug
    
    @new_party = PartyTime.create(strong_params)
    if @new_party.valid?
    @new_rsvp = Rsvp.create(user_id: session[:user_id], party_time_id: @new_party.id)
    redirect_to @current_user
    else 
    flash[:errors] = @new_party.errors.full_messages
    redirect_to @new_party.business
    end 
   end

   def edit
    @party_time = PartyTime.find(params[:id])
   end

   def update
    
    @party_time = PartyTime.find(params[:id])
      @party_time.update(strong_params)
      if @party_time.valid?
      @party_time.save
      redirect_to @current_user
      else
      flash[:errors] = @party_time.errors.full_messages
      redirect_to edit_party_time_path(@party_time)
      end
   end

   def destroy
    @party_time = PartyTime.find(params[:id])
    @party_time.destroy
    redirect_to @current_user
   end

   private
   def strong_params
   strong_params = params.require(:party_time).permit(:date,:occasion,:business_id, :creator_id, :time)
   end
end
