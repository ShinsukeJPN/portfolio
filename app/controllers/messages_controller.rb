class MessagesController < ApplicationController
	before_action do
		@room = Room.find(params[:room_id])
	end

  def index
  	@message = Message.new(send_user_id: current_user)
  	@messages = @room.messages
      if @messages.count > 7
        @over_seven = true
        @messages = @messages[-7..-1]
      end

    if params[:m]
      @over_seven = false
      @messages = @room.messages
    end

    @reservation = Reservation.new
  end

  def create
    if params[:room_id].present?
      @message = Message.new(message_params)
      @message.room_id = params[:room_id]
    else
      @message = Message.new(message_params)
      @room = Room.new
    end
    @message.save
    redirect_to room_messages_path
  end

  private
  def message_params
  	params.require(:message).permit(:user_id, :send_user_id, :comment)
  end
end