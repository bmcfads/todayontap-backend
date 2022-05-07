class V1::VenuesController < ApplicationController
  skip_before_action :authorize_request, only: %i[index category show]
  before_action :set_venue, only: %i[show update destroy]

  # GET v1/venues
  def index
    @venues = Venue.all.order('name')
  end

  def category
    @venues = Venue.get_venues_in_category(params[:category])
    render :index
  end

  # GET v1/venues/:slug
  def show; end

  # POST v1/venues
  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      render :show, status: :created, location: v1_venue_url(@venue)
    else
      render json: @venue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT v1/venues/:slug
  def update
    if @venue.update(venue_params)
      render :show, status: :ok, location: v1_venue_url(@venue)
    else
      render json: @venue.errors, status: :unprocessable_entity
    end
  end

  # DELETE v1/venues/:slug
  def destroy
    @venue.destroy
    redirect_to(v1_venues_path)
  end

  private

  def set_venue
    @venue = Venue.find_by(slug: params[:slug])
  end

  def venue_params
    params.require(:venue).permit(:featured, :category, :name, :description, :street, :city, :province, :postal_code,
                                  :slug, :website_url, :thumbnail_url, :banner_url, :google_maps_embed_url)
  end
end
