class HotelsController < ApplicationController
  respond_to :html

  before_filter :authenticate_user!, except: [:index]

  def index
    @hotels = Hotel.all.sort_by { |h| -h.average_rating }.first(5)
    respond_with(@hotels)
  end

  def show
    @hotel = Hotel.find(params[:id])
    @comment = Comment.new(hotel_id: params[:id])

    respond_with(@hotel)
  end

  def new
    @hotel = Hotel.new
    respond_with(@hotel)
  end

  def edit
    @hotel = Hotel.find(params[:id])
    respond_with(@hotel)
  end

  def create
    @hotel = Hotel.new(hotel_params)
    flash[:notice] = 'Hotel was successfully created.' if @hotel.save
    respond_with(@hotel)
  end

  def update
    @hotel = Hotel.find(params[:id])
    flash[:notice] = 'Hotel was successfully updated.' if @hotel.update(hotel_params)
    respond_with(@hotel)
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    flash[:notice] = 'Hotel was successfully deleted.' if @hotel.destroy
    respond_with(@hotel)
  end

  private

  def hotel_params
    params.require(:hotel).permit(:title, :room_description, :price, :breakfast,
                                  :image,
                                  location_attributes: [:country, :city, :state,
                                                        :street])
  end
end
