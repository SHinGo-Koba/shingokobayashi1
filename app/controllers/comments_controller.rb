class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: params[:post_id])
    if @post && @comment.save
      redirect_to post_path(params[:post_id])
      flash[:notice] = "Commented!"
    else
      render "/posts/index"
      flash.now[:notice] = "It couldn't be commented"
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: session[:user_id], post_id: params[:post_id])
    end
  
end
