class WelcomeController < ApplicationController
  def index
  end

  def new
    @location = Location.new
  end

  def create
  end
end
