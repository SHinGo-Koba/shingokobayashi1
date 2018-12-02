class CommentsController < ApplicationController
  before_action :confirm_login
  
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: params[:post_id])
    if @post && @comment.save
      # redirect_to post_path(params[:post_id])
      @comments = @post.comments
      flash.now[:notice] = "Commented!"
    else
      render "/posts/index"
      flash.now[:notice] = "That post couldn't be found"
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: session[:user_id], post_id: params[:post_id])
    end
  
end
