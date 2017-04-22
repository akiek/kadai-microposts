class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
    @microposts = current_user.show_microposts.order('created_at DESC').page(params[:page])
  end
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.add(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to current_user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.exclude(micropost)
    flash[:success] = 'お気に入りから削除しました。'
    redirect_to current_user
  end
end
