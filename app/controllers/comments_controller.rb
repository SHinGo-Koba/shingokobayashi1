class CommentsController < ApplicationController
  before_action :confirm_login
  
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: params[:post_id])
    
    respond_to do |format|
      if @post && @comment.save
        @comments = @post.comments
        format.js { flash[:notice] = "Commented!" }
      else
        format.js { flash[:notice] = "That post couldn't be found" }
      end
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: session[:user_id], post_id: params[:post_id])
    end
  
end
