class V1::EventsController < ApplicationController
  skip_before_action :authorize_request, only: %i[index timeframe show]
  before_action :set_venue, except: :timeframe
  before_action :set_event, only: %i[show update destroy]

  # GET v1/venues/:venue_slug/events
  def index
    @events = @venue.events.order('datetime')
  end

  def timeframe
    @events = Event.get_events_in_timeframe(params[:timeframe])
    render :index
  end

  # GET v1/venues/:venue_slug/events/:id
  def show; end

  # POST v1/venues/:venue_slug/events
  def create
    @event = @venue.events.build(event_params)

    if @event.save
      render :show, status: :created, location: v1_venue_event_url(@event.venue_id, @event.id)
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT v1/venues/:venue_slug/events/:id
  def update
    if @event.update(event_params)
      render :show, status: :ok, location: v1_venue_event_url(@event.venue_id, @event.id)
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE v1/venues/:venue_slug/events/:id
  def destroy
    @event.destroy
    redirect_to(v1_venue_events_path(@event.venue.slug))
  end

  private

  def set_venue
    @venue = Venue.find_by(slug: params[:venue_slug])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:featured, :category, :name, :description, :datetime, :website_url, :thumbnail_url,
                                  :banner_url, :venue_id)
  end
end
