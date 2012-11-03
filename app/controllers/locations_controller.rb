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
    @locations = Location.where("address like ?", "%#{address}%")
    if @locations.size > 1
      render 'index' and return
    elsif @locations.size == 1
      redirect_to @locations.first and return
    else
      #@locations = Location.all
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
    if @location.address.blank?
      flash.now[:error] = "Unable to find location."
      render :action => 'new' and return
    elsif new_record && @location.update_attributes(params[:location].except(:address))
      redirect_to @location and return 
    elsif !new_record
      flash[:notice] = "Location already exists."
      redirect_to @location
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
    @location.present? and @location.created_at > 1.minutes.ago 
  end

end
