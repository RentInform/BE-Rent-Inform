class Api::V0::UserPropertiesController < ApplicationController
  def index
    user_properties = UserPropertyFacade.new.get_properties(params[:user_id])
    render json: UserPropertySerializer.new(user_properties)
  end
end
