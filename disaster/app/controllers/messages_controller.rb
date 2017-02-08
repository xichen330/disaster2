class MessagesController < ApplicationController
  before_action :set_event

  def new
    @message = @event.messages.new
  end
  def create
    @message = @event.messages.new(message_params)
    @message.save

    redirect_to events_url(@event)
  end



  private

  def message_params
    params.require(:message).permit(:name, :text)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
