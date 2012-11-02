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
    location = Location.find_by_address(address)
    #location = LocationCache.for_address address.chomp if address.present?
    if location.present?
      redirect_to location and return if location.present?
    else
      @locations = Location.all
      flash.now[:error] = "Unable to find location."
      render 'index'
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    location = Location.new(params[:location])
    @location = LocationCache.for_address location.address.chomp if location.address.present?
    if !@location.nil? && new_record && @location.update_attributes(params[:location].except(:address))
      redirect_to @location and return 
    elsif !new_record
      flash[:notice] = "Location already exists."
      redirect_to @location
    elsif @location.nil?
      flash.now[:error] = "Unable to find location."
      render :action => 'new'
    else
      render :action => 'new'
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location].except(:address))
      redirect_to @location
    else
      flash.now[:error] = "Unable to update location info."
      render action: "edit"
    end
  end
  private
  def new_record
    @location.created_at > 1.minutes.ago 
  end

end
