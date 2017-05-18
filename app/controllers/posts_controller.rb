class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create post_params
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
  # Confirms a logged-in user.
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Whoops! Please log in to create a post."
        redirect_to login_url
      end
    end
end
