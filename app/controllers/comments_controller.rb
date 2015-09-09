class CommentsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!

  def create
    @comment = Comment.new
    @comment.body = content_params
    @comment.user_id = current_user.id
    @comment.hotel_id = (params[:hotel_id])
    flash[:notice] = 'Comment was successfully created.' if @comment.save
    respond_with(@comment) do |format|
      format.html { redirect_to :back }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment was successfully deleted.' if @comment.destroy
    respond_with(@comment) do |format|
      format.html { redirect_to :back }
    end
  end

  private

  def content_params
    params.require(:content)
  end
end
