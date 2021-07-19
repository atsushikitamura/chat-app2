class RoomsController < ApplicationController

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
  # user_ids: [] 配列に対して保存を許可したい場合は、キーに対し[]を値として記述
end
