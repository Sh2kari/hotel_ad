class RatingsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!

  def create
    @hotel = Hotel.find_by_id(params[:hotel_id])
    @rating = Rating.new(rating_params)
    @rating.hotel_id = @hotel.id
    @rating.user_id = current_user.id
    respond_with(@rating) do |format|
      if @rating.save
        flash[:notice] = 'Your rating has been saved' 
        format.html { redirect_to hotel_path(@hotel)}
      else
        flash[:notice] = 'Your already rate this hotel'
        format.html { redirect_to hotel_path(@hotel)}
      end
    end
  end

  def update
    @hotel = Hotel.find_by_id(params[:hotel_id])
    @rating = current_user.ratings.find_by_hotel_id(@hotel.id)
    flash[:notice] = 'Your rating has been updated.' if @rating.update_attributes(rating_params)
    respond_with(@rating)
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end
