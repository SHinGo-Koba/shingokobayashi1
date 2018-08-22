class PostsController < ApplicationController
  before_action:authenticate_user, {only:[:new]}
  before_action:forbid_access_posts, {only:[:destroy]}
  before_action :method_out_of_service, {only:[:create]}


  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
  end
  
  def create
      # @post = Post.new(
      # user_id: session[:user_id],
      # content: params[:content]
      # )
      @post = Post.new(post_params)
      @post.user_id = session[:user_id]
      @post.content = params[:content]
      file = params[:post_image]
      name = file.original_filename
      perms = [".jpg", ".jpeg", ".gif", ".png"]
    if file
      if !perms.include(File.extname(name).downcase)
        render("/posts/new")
      elsif file.size > 1.megabyte
        render("/posts/new")
      else
        name = "#{rand.to_s[2..8]}.jpg"
        @post.post_image_name = name
        @post.post_image = params[:post_image]
      end
    end
    
    if @post.save
      redirect_to("/posts/index")
    else
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
    params.require(:post).permit(:user_id, :content,
    :post_image, :post_image_name)
  end

  
end
