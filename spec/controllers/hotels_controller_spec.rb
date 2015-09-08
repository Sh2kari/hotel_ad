require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  def valid_attributes
    { title: "title", room_description: "rock", 
      price: "323", breakfast: "no" }
  end

  describe "GET index" do
    it "assigns all @hotels" do
    hotel = Hotel.create! valid_attributes
    get :index
    expect(assigns(:hotels)).to eq([hotel])
    end
  end
end
