class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(5)
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    @event.save

    redirect_to events_url
  end
  def show
    @event = Event.find(params[:id])
    @message = @event.messages.all
  end
  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)

    redirect_to event_url(@event)
  end
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_url
  end
  def msg
    @message = Message.new
  end
  def leave_msg
    @message = Message.new(msg_params)
    @message.save

    redirect_to :action => :index
  end



  private

  def event_params
    params.require(:event).permit(:title, :description, :category_id)
  end
  def msg_params
    params.require(:message).permit(:name, :message, :event_id)
  end
end
