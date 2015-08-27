module ApplicationHelper
  def rating_ballot
    if @rating = current_user.ratings.find_by_hotel_id(params[:id])
      @rating = Rating.new
    else
      current_user.ratings.new
    end
  end
  def current_user_rating
    if @rating = current_user.ratings.find_by_hotel_id(params[:id])
      @rating.value
    else
      "N/A"
    end
  end
end
