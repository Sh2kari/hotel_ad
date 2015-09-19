class CommentsController < ApplicationController
  respond_to :html

  before_filter :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    flash[:notice] = @comment.save ? 'Comment was successfully created.' : 'Comment are blank or too long.'

    respond_with(@hotel, location: hotel_path(comment_params[:hotel_id]))
  end

  def destroy
    @comment = Comment.find(params[:id])
    flash[:notice] = 'Comment was successfully deleted.' if @comment.destroy

    respond_with(@hotel, location: hotel_path(@comment.hotel))
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :hotel_id, :user_id)
  end
end
