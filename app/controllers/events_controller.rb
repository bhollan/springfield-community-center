class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    if user_signed_in?
      @event = Event.create(event_params)
      binding.pry
      @event.user = current_user
      @event.update(event_date: Date.strptime(params[:event][:event_date], '%m/%d/%Y'))
      flash[:success] = "New event created."
      redirect_to event_path(@event)
    else
      redirect_to new_user_session_path, alert: "You must be signed in to create events."
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    if user_signed_in? && current_user.id == @event.user.id && @event.event_date >= Date.current
      @modifiable_or_deletable = true
    else
      @modifiable_or_deletable = false
    end
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.update(event_date: Date.strptime(params[:event][:event_date], '%m/%d/%Y'))
    @event.update(event_params)
    flash[:success] = "Successfully updated event."
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    if current_user.id == @event.user.id
      @event.destroy
      flash[:notice] = "'#{@event.title}' event successfully destroyed."
      redirect_to root_path
    else
      flash[:warning] = "You must own an event to cancel it."
      redirect_to root_path
    end
  end

  private

  def event_params
    params.require(:event).permit([:title])
  end
end
