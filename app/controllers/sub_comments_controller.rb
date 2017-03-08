class SubCommentsController < ApplicationController



  def create

    @new_sub_comment = SubComment.new(sub_comment_params)
    @new_sub_comment.user = current_user

    if @new_sub_comment.save
      respond_to? do |format|
        format.js
      end
    end
  end

  def edit
    @sub_comment = SubComment.find(params[:sub_comment_id])
  end

  def update
    byebug
    @post = Post.find(params[:post_id])
    @sub_comment = SubComment.find(params[:sub_comment_id])
    respond_to do |format|
      if @sub_comment.update_attributes(sub_comment_params)
        format.html{ redirect_to @post}
      end
    end
  end


  private

  def sub_comment_params
    params.require(:sub_comment).permit(:body, :comment_id)
  end
end
