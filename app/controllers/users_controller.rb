class UsersController < ApplicationController

  before_action :search

  def home
  end

  def search
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def profile
    @user = User.all
  end

  def account
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "タイトル「#{current_user.id}」の情報を更新しました"
      redirect_to "/users/profile"
    else
      flash[:alert] = "施設情報の更新に失敗しました"
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar, :full_name, :introduction, :user_id)
  end

end
