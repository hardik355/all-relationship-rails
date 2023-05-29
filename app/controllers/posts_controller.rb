class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.includes(:tags)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save 
    redirect_to posts_path
  end 

  def show
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post = @post.update(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, tag_ids: [])
  end 
end
