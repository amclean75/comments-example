class CommentsController < ApplicationController

def create
@post = Post.find(params[:post_id])
	Comment.create(body: params[:comment][:body], post: @post)
	redirect_to @post, notice: "New comment created."
end

def destroy 
	Comment.destroy 
	redirect_to @post, notice: "That comment was deleted."
end


end
