# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :set_property

  def index
    images = @property.images
    render json: images.as_json(only: %i[image_url position])
  end

  def update_order
    image_ids = reorder_params[:image_ids]
    service = ImagesService::ReorderImages.new(@property, image_ids)
    result = service.call

    render json: { message: result[:message] }, status: result[:status]
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def reorder_params
    params.permit(image_ids: [])
  end
end
