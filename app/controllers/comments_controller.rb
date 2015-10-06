class CommentsController < ApplicationController

def create
@post = Post.find(params[:post_id])
	Comment.create(body: params[:comment][:body], post: @post)
	redirect_to @post, notice: "New comment created."
end

def destroy 
	@post = Post.find(params[:post_id])
	@comment = Comment.find(params[:id]) 
	if @comment.destroy
		redirect_to @post, notice: "That comment was deleted."
	else
		redirect_to @post, notice: "Something went wrong!"
	end
end


end
