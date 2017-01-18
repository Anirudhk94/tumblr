class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))

		redirect_to post_path(@post)
	end

	def destroy		
		@comment = Comment.find(params[:post_id])
		@comment.destroy
		
		@post = Post.find(params[:id])
		
		redirect_to post_path(@post)
	end
end
