class ReservationsController < ApplicationController

  before_action :move_to_signed_in

  private
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/login'
    end
  end

  def index
    
  end

  def new
  end

  def create
  end

  def edit

  end

  def destoy

  end

end
