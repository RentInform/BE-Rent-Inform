class Api::V0::UserPropertiesController < ApplicationController
  def index
    user_properties = UserPropertyFacade.new.get_properties(params[:user_id])
    render json: BasePropertySerializer.new(user_properties)
  end

  def show
    property = Property.find(params[:property_id])
    PropertySearchFacade.new.set_scores(property)
    render json: PropertySerializer.new(property)
  end

  def create
    user_property = UserProperty.new(user_id: params[:user_id], property_id: params[:property_id])
    if user_property.save
      render json: UserPropertySerializer.new(user_property), status: 201
    else
      render json: { "data": nil }, status: 400
    end
  end
end
