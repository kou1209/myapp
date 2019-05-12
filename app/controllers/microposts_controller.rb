class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new]
  before_action :correct_user,   only: :destroy

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      @feed_items = Micropost.paginate(page: params[:page], per_page: 5)
      render 'microposts/new'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, tag:[])
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
