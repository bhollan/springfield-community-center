class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    if user_signed_in?
      @event = Event.create(event_params)
      @event.update(user: current_user)
      @event.update(event_date: Date.strptime(params[:event][:event_date], '%m/%d/%Y'))
      redirect_to event_path(@event)
    else
      redirect_to root_path
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit([:title, :event_date])
  end
end
