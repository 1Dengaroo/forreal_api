# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :set_property

  def index
    images = @property.images.order(:position)
    render json: images.as_json(only: %i[image_url position])
  end

  def update_order
    image_positions = reorder_params
    service = ImagesService::ReorderImages.new(@property, image_positions)
    result = service.call

    render json: { message: result[:message] }, status: result[:status]
  end

  private

  def set_property
    @property = Property.find_by(id: params[:property_id])
    render json: { error: 'Property not found' }, status: :not_found unless @property
  end

  def reorder_params
    params.require(:image_positions)
    params.permit(image_positions: [])[:image_positions].map(&:to_i)
  end
end
