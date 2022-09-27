class Api::V1::BreweryController < ApplicationController
  def index
    breweries = BreweryFacade.find_breweries(params[:city], params[:qty])
  end
end