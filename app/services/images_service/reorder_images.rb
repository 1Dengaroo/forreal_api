# frozen_string_literal: true

module ImagesService
  class ReorderImages
    def initialize(property, image_ids)
      @property = property
      @image_ids = image_ids.map(&:to_i)
    end

    def call
      validation_result = validate_image_ids
      return validation_result unless validation_result[:success]

      reorder_images(@image_ids)

      { success: true, message: 'Order updated successfully', status: :ok }
    rescue ActiveRecord::RecordNotFound => e
      { success: false, message: e.message, status: :not_found }
    rescue ActiveRecord::RecordInvalid => e
      { success: false, message: e.message, status: :unprocessable_entity }
    end

    private

    def validate_image_ids
      all_image_ids = @property.images.pluck(:id)
      return { success: false, message: 'image_ids cannot be empty', status: :bad_request } if @image_ids.blank?
      return { success: false, message: 'Duplicate image IDs are not allowed', status: :unprocessable_entity } if @image_ids.uniq.length != @image_ids.length
      return { success: false, message: "You must provide exactly #{all_image_ids.length} image IDs", status: :unprocessable_entity } if @image_ids.length != all_image_ids.length
      return { success: false, message: "Image IDs do not match the property's image set", status: :unprocessable_entity } if @image_ids.sort != all_image_ids.sort

      { success: true, message: 'Validation passed', status: :ok }
    end

    def reorder_images(new_order)
      Image.transaction do
        new_order.each_with_index do |id, index|
          image = @property.images.find(id)
          image.update!(position: index)
        end
      end
    end
  end
end
