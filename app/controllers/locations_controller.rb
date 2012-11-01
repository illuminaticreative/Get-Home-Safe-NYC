class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    borough = Borough.where(:name => params[:borough]).first
    @location = Location.new(borough_id:borough.id)
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(params[:location])
    location = Location.find_by_address @location.address.chomp
    redirect_to location and return if location.present?
    render 'new'
  end

  def update
  end
end
