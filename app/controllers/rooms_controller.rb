class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @user = current_user.id
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:facility_name, :facility_detail, :price, :address, :facility_img, :user_id))
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
  end

  def own
    @rooms = Room.where(user_id: current_user.id)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @room.update(params.require(:room).permit(:facility_name, :facility_detail, :price, :address, :facility_img, :user_id))
      flash[:notice] = "タイトル「#{@room.fasility_name}」の情報を更新しました"
      redirect_to :tasks
    else
      flash[:alert] = "施設情報の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
  end

end
