class EventsController < ApplicationController
  def new
    if !user_signed_in?
      flash[:alert] = "You must be signed in to create events."
    end
    @event = Event.new
  end

  def create
    if user_signed_in?
      @event = Event.create(event_params)
      @event.assign_attributes(table_and_chair_quantity_params)
      @event.user = current_user
      @event.assign_attributes(event_date: Date.strptime(params[:event][:event_date], '%m/%d/%Y'))
      if @event.save
        flash[:success] = "New event created."
        redirect_to event_path(@event)
      else
        render :new
      end
    else
      redirect_to new_user_session_path, alert: "You must be signed in to create events."
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    if user_signed_in? && current_user.id == @event.user.id && @event.event_date >= (Date.current - 1)
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
    @event.assign_attributes(event_date: Date.strptime(params[:event][:event_date], '%m/%d/%Y'))
    @event.event_assets.destroy_all
    @event.reload
    @event.assign_attributes(event_params)
    @event.assign_attributes(table_and_chair_quantity_params)
    if @event.save
      flash[:success] = "Successfully updated event."
      redirect_to event_path(@event)
    else
      render :edit
    end
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

  def search
  end

  def results
    @event = Event.find_by(title: params['Event Name'.to_sym])
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit([:title, asset_ids: []])
  end
  def table_and_chair_quantity_params
    params.require(:event).permit([:chair_quantity, :table_quantity])
  end
end
