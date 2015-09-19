require 'spec_helper'

RSpec.describe CommentsController, :type => :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it 'should have a current_user' do
    expect(subject.current_user).not_to be_nil
  end

  describe 'POST create comment' do
    describe 'with valid params' do
      it 'creates a new comment, response, assigns' do
        comment = FactoryGirl.create(:comment)
        expect {
          post :create, comment: { body: 'new_comment', hotel_id: 'hotel_id', user_id: 'user_id' }
        }.to change(Comment, :count).by(1)
        expect(flash[:notice]).to eq('Comment was successfully created.')
        expect(assigns(:comment)).to eq(Comment.last)
        expect(response).to redirect_to(hotel_path(:hotel_id))
      end
    end

    describe 'with invalid params' do
      it 'do not create a new comment, re-render show' do
        expect {
          post :create, comment: { body: '', hotel_id: 'hotel_id', user_id: 'user_id' }
        }.to change(Comment, :count).by(0)
        expect(flash[:notice]).to eq('Comment are blank or too long.')
        expect(response).to redirect_to(hotel_path(:hotel_id))
      end
    end
  end

  describe 'delete' do
    it 'destroys comment and redirects to show page of hotel' do
      comment = Comment.create!(body: 'new_comment', hotel_id: 'hotel.id', user_id: 'user.id')
      expect {
        delete :destroy, { id: comment.id, hotel_id: comment.hotel_id }
      }.to change(Comment, :count).by(-1)
    end
  end
end
