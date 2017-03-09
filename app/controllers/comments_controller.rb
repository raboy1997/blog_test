class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html {}
        format.js { render partial: 'comment' }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to @post }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Comment deleted.'
        redirect_to @post
      end
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
