class RoomsController < ApplicationController

  before_action :search

  def index
    @rooms = Room.all
  end

  def new
    @user = current_user.id
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "新規施設の登録をしました"
      redirect_to "/rooms/own"
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def own
    @rooms = Room.where(user_id: current_user.id)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "タイトル「#{@room.facility_name}」の情報を更新しました"
      redirect_to "/rooms/own"
    else
      flash[:alert] = "施設情報の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to "/rooms/own"
  end

  def search
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  private
  def room_params
    params.require(:room).permit(:facility_name, :facility_detail, :price, :address, :facility_img, :user_id)
  end


end
