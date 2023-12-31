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
    if UserProperty.find_by(user_id: params[:user_id], property_id: params[:property_id])
      render json: { "error": "User has already saved this property" }, status: 422
    else
      user_property = UserProperty.create(user_id: params[:user_id], property_id: params[:property_id])
      render json: UserPropertySerializer.new(user_property), status: 201
    end
  end

  def destroy
    user_property = UserProperty.find_by(user_id: params[:user_id], property_id: params[:property_id])

    if user_property.nil?
      render json: { "errors": [{"detail": "No UserProperty with user_id=#{params[:user_id]} and property_id=#{params[:property_id]} exists"}]},
             status: 404
    else
      user_property.destroy
    end
  end
end
