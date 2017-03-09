class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:create, :destroy, :edit]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @users = User.all
  end

  def show
    @new_comment = Comment.new
    @new_sub_comment = SubComment.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created.'
      redirect_to @post
    else
      render 'posts/new'
    end
  end

  def edit; end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = 'The post was updated.'
      redirect_to @post
    else
      render 'posts/edit'
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post deleted.'
      redirect_to root_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
