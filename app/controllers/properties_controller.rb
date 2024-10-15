# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    properties = Property.all
    render json: properties
  end

  def show
    property = Property.find_by(id: params[:id])
    render json: property
  end
end
