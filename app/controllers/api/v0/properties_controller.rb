class Api::V0::PropertiesController < ApplicationController
  before_action :check_database_for_property, only: [:search]

  def search
    PropertySearchFacade.new.set_city_and_state(@property)
    render json: BasePropertySerializer.new(@property)
  end

  private

  def check_database_for_property
    @property = PropertySearchFacade.new.search_by_address(params[:street])
    render json: { "data": nil }, status: 404 if @property.nil?
  end
end