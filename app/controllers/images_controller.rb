# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :set_property

  def index
    images = @property.images
    render json: images
  end

  def reorder
    image_ids = params.require(:image_ids)
    ActiveRecord::Base.transaction do
      image_ids.each_with_index do |id, index|
        image = @property.images.find(id)
        image.update!(position: index)
      end
    end
    render json: { status: 'ok' }
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end
end
