class PostsController < ApplicationController
  before_action:authenticate_user, {only:[:new]}
  before_action:forbid_access_posts, {only:[:destroy]}
  # before_action:method_out_of_service, {only:[:create]}


  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post_image_name = "#{rand.to_s[2..8]}.jpg"
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to posts_path
      flash[:notice] = "just posted!"
    else
      flash.now[:notice] = "Failed..."
      render("/posts/new")
    end
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
  
  
  private
    def forbid_access_posts
      @post = Post.find_by(id: params[:id])
      if @post.user_id != @current_user.id
        redirect_to("/posts/index")
        flash[:notice] = "I'm sorry you're not allowed this"
      end
    end
  
    def post_params
      params.require(:post).permit(:content,:post_image).merge(
          user_id: session[:user_id],
          post_image_name: @post_image_name,
          )
    end

end
