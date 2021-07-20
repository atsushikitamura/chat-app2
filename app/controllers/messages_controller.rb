class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    # ルーティングをネストしているため/rooms/:room_id/messagesといったパスになります。
    # パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、room_idという値が存在しています。
    # そのため、params[:room_id]と記述することでroom_idを取得できます。
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
