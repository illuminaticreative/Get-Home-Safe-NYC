class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    #borough = Borough.where(:name => params[:borough]).first
    #Borough.find_by_
    @location = Location.new
  end

  def edit
    @location = Location.find(params[:id])
  end

  def search
    address = params[:address]
    location = LocationCache.for_address address.chomp if address.present?
    if location != GeoEngine::NoAddress
      redirect_to location and return if location.present?
    end
    @locations = Location.all
    render 'index'
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    debugger
    location = Location.new(address:params[:location])
    @location = LocationCache.for_address location.address.chomp if location.address.present?
    if @location != GeoEngine::NoAddress
      @location.update_attributes(params[:location].except(:address))
      redirect_to @location and return if @location.present?
    else
      render :action => 'new'
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location
    else
      render action: "edit"
    end
  end

end
