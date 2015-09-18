class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
	  @posts = Post.all  
  end

  def new
	  @post = Post.new
  end

  def show
	  @comment = Comment.new
  end

  def edit
  end
  
  def create 
	  @post = Post.create(post_params)
	  redirect_to @post, notice: "New post created."
  end
  
  def update 

  end
  
  def destroy 
	  @post = Post.find(params[:id])
	  @post.destroy 
		redirect_to posts_path, notice: "Post was deleted."
  end
  
  private 
  
  def post_params
	    params.require(:post).permit(:body, :title).merge(user: current_user)
  end
  
  def set_post
	  begin 
	  @post = Post.find(params[:id])
	  rescue 
	  flash[:notice] = "That post is not available."
	  redirect_to posts_path
	  end
  end
end
