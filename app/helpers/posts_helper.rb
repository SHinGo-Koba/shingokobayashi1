module PostsHelper
  
  def forbid_access_posts
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      redirect_to("/posts/index")
      flash[:notice] = "I'm sorry you're not allowed this"
    end
  end

end
