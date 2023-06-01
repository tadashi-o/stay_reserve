class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    @user = current_user.id
    @reservation = Reservation.new(reservation_params)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to "/reservations"
    else
      render "/reservations/confirm"
    end
  end

  def back
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin,:checkout,:user_id,:room_id,:people))
    @room = Room.find(@reservation.room_id)
    @user = User.find(@reservation.user_id)
    render "/rooms/own"
  end

  private
  def reservation_params
    params.require(:reservation).permit(:checkin,:checkout,:pepole, :user_id, :room_id)
  end

end