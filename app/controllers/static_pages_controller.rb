class StaticPagesController < ApplicationController

  def home
    @feed_items = Micropost.paginate(page: params[:page], per_page: 5)
    if logged_in?
      @micropost  = current_user.microposts.build
    end
  end

  def rules
  end

  def about
  end

  def contact
  end
end
