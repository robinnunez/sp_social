class PostsController < ApplicationController
  def index
    @posts = Post.all.order(:created_at)
    @post = Post.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @comment = Comment.new
    respond_to do |format|
      format.js {render :new}
    end
  end

  def create
    @post = Post.new(post_params)
    @comment = Comment.new
    respond_to do |format|
      if @post.save
        format.js {render :create}
      else
        format.js {render :error}
      end
    end
  end

  def edit
    @comment = Comment.new
    set_post
    respond_to do |format|
      format.js {render :edit}
    end
  end

  def update
    @comment = Comment.new
    set_post
    @post.update(post_params)
    respond_to do |format|
      format.js {render :update}
    end
  end

  def destroy
    set_post
    @post.destroy
    respond_to do |format|
      format.js {render :destroy}
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:photo, :user_id)
    end
end
