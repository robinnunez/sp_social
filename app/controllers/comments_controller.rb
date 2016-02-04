class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js {render :create}
      else
        format.js {render :error}
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:comment, :post_id, :user_id)
    end
end
