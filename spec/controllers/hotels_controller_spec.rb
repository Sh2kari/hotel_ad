require 'spec_helper'

RSpec.describe HotelsController, :type => :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  def valid_attributes
    { title: 'Title', room_description: 'Black hole',
      breakfast: 'yes', price: '666' }
  end

  describe 'GET index' do
    it 'assigns all @hotels' do
      hotel = FactoryGirl.create(:hotel)
      get :index
      expect(assigns(:hotels)).to eq([hotel])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns @hotel' do
      hotel = FactoryGirl.create(:hotel)
      get :show, id: hotel.id
      expect(assigns(:hotel)).to eq(hotel)
      expect(response).to render_template('show')
    end
  end

  describe 'GET new' do
    it 'assigns a new hotel' do
      get :new
      expect(assigns(:hotel)).to be_a_new(Hotel)
    end

    it 'renders the new hotel template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'GET edit' do
    it 'assigns edit hotel' do
      hotel = FactoryGirl.create(:hotel)
      get :edit, id: hotel.id
      expect(assigns(:hotel)).to eq(hotel)
      expect(response).to render_template('edit')
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new hotel' do
        expect {
          post :create, hotel: valid_attributes
        }.to change(Hotel, :count).by(1)
      end

      it 'assigns a newly created hotel as @hotel' do
        post :create, hotel: valid_attributes
        expect(assigns(:hotel)).to be_a(Hotel)
        expect(assigns(:hotel)).to be_persisted
      end

      it 'redirects to the created hotel' do
        post :create, hotel: valid_attributes
        expect(response).to redirect_to(hotel_path(Hotel.last))
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved hotel as @hotel' do
        expect {
          post :create, hotel: { title: '', room_description: '',
      breakfast: '', price: '' }
        }.to change(Hotel, :count).by(0)
      end

      it 're-renders the new template' do
        expect {
          post :create, hotel: { title: '', room_description: '',
      breakfast: '', price: '' }
        }.to change(Hotel, :count).by(0)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PATCH update and redirect and assign' do
    describe 'with valid params' do
      it 'updates the requested hotel' do
        hotel = FactoryGirl.create(:hotel)
        put :update, hotel: { 'title' => 'SAD TITLE' }, id: hotel
        expect(assigns(:hotel)).to eq(hotel)
        expect(response).to redirect_to(hotel_path(hotel))
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested hotel' do
      hotel = FactoryGirl.create(:hotel)
      expect {
        delete :destroy, id: hotel.id.to_s
      }.to change(Hotel, :count).by(-1)
    end

    it 'redirects to the hotels list' do
      hotel = FactoryGirl.create(:hotel)
      delete :destroy, id: hotel.id.to_s
      expect(response).to redirect_to(hotels_url)
    end
  end
end
