class Api::V0::UserPropertiesController < ApplicationController
  def index
    user_properties = UserPropertyFacade.new.get_properties(params[:user_id])
    render json: UserPropertySerializer.new(user_properties)
  end

  def show
    user_property = UserPropertyFacade.new.get_property(params[:user_id], params[:property_id])
    PropertySearchFacade.new.set_scores(user_property)
    render json: UserPropertySerializer.new(user_property)
  end
end
