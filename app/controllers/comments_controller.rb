class CommentsController < ApplicationController

  def new
    @micropost = Micropost.find(params[:micropost_id])
    @comment = Comment.new
    @user = User.find_by(id: @micropost.user_id)
  end

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to root_path
    else
      render 'comments/new'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
