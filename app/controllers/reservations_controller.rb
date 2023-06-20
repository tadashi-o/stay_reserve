class ReservationsController < ApplicationController
  
  def index
    @room = Room.all
    @reservation = Reservation.where(user_id: current_user.id)
  end

  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    @user = current_user.id
    @reservation = Reservation.new(reservation_params)
    unless @reservation.valid?
      render template: "rooms/show"
    end
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @user = current_user.id
    render room_path(@room) and return if !@reservation.save
    redirect_to "/reservations"
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def edit_confirm
    @reservation = Reservation.find(params[:id])
    @reservation.attributes = reservation_params
    render :edit if @reservation.invalid?
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice] = "施設名「#{@reservation.room.facility_name}」の情報を更新しました"
      redirect_to "/reservations"
    else
      flash[:alert] = "施設情報の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to "/reservations"
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in,:check_out,:pepole, :user_id, :room_id)
  end

end