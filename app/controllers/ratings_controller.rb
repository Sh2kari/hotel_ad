class RatingsController < ApplicationController
  before_filter :authenticate_user!

    def create
    @hotel = Hotel.find_by_id(params[:hotel_id])
      @rating = Rating.new(rating_params)
      if current_user.id == @hotel.id
        redirect_to hotel_path(@hotel), :alert => "You cannot rate for your own hotel"
      else
        @rating.hotel_id = @hotel.id
        @rating.user_id = current_user.id
        if @rating.save
          redirect_to hotel_path(@hotel), :notice => "Your rating has been saved"
        else
          redirect_to hotel_path(@hotel), :alert => "You already rate this hotel"
        end
      end
    end

    def update
      @hotel = Hotel.find_by_id(params[:hotel_id])
      if current_user.id == @hotel.id
        redirect_to hotel_path(@hotel), :alert => "You cannot rate for your own hotel"
      else
        @rating = current_user.ratings.find_by_hotel_id(@hotel.id)
        if @rating.update_attributes(params[:rating])
          redirect_to hotel_path(@hotel), :notice => "Your rating has been updated"
        end
      end
    end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end
