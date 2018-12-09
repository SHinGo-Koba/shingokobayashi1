class PostsController < ApplicationController
  before_action :confirm_login, { only: [:new, :create] }
  before_action :forbid_access_posts, { only: [:destroy] }
  # before_action :method_out_of_service, { only: [:create] }

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end
  
  def create
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
    @comment = Comment.new
    @comments = @post.comments
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
    def post_params
      params.require(:post).permit(:content,:post_image).merge(user_id: session[:user_id])
    end

    def forbid_access_posts
      @post = Post.find_by(id: params[:id])
      unless current_user?(@post.user)
        redirect_to posts_path
        flash[:notice] = "I'm sorry you're not allowed this"
      end
    end
end
