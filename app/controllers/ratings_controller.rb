class RatingsController < ApplicationController
  respond_to :html

  before_filter :authenticate_user!

  def create
    @rating = current_user.ratings.build(rating_params)
    @rating.hotel_id = params[:hotel_id]
    flash[:notice] = @rating.save ? 'Your rating has been saved' : 'Your already rate this hotel'

    respond_with(@hotel, location: hotel_path(params[:hotel_id]))
  end

  private

  def rating_params
    params.require(:rating).permit(:value)
  end
end
