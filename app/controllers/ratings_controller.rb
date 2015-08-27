class RatingsController < ApplicationController
  before_filter :authenticate_user!

    def create
    @hotel = Hotel.find_by_id(params[:hotel_id])
    if current_user.id == @hotel.id
      redirect_to hotel_path(@hotel), :alert => "You cannot rate for your own hotel"
    else
      @rating = Rating.new(rating_params)
      @rating.hotel_id = @hotel.id
      @rating.user_id = current_user.id
    if @rating.save
      respond_to do |format|
      format.html { redirect_to hotel_path(@hotel), :notice => "Your rating has been saved" }
      end
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
          respond_to do |format|
          format.html { redirect_to hotel_path(@hotel), :notice => "Your rating has been updated" }
          end
        end
      end
    end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end
