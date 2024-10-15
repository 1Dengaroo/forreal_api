# frozen_string_literal: true

module ImagesService
  class ReorderImages
    def initialize(property, image_positions)
      @property = property
      @image_positions = image_positions.map(&:to_i)
    end

    def call
      validation_result = validate_positions
      return validation_result unless validation_result[:success]

      reorder_images

      { success: true, message: 'Order updated successfully', status: :ok }
    rescue ActiveRecord::RecordInvalid => e
      { success: false, message: e.record.errors.full_messages.join(', '), status: :unprocessable_entity }
    end

    private

    def validate_positions
      return { success: false, message: 'image_positions cannot be empty', status: :bad_request } if @image_positions.blank?

      image_count = @property.images.count
      valid_indices = (0...image_count).to_a

      return { success: false, message: "image_positions must be a permutation of #{valid_indices}", status: :unprocessable_entity } unless @image_positions.sort == valid_indices

      { success: true, message: 'Validation passed', status: :ok }
    end

    def reorder_images
      images = @property.images.order(:position).to_a

      Image.transaction do
        @image_positions.each_with_index do |current_index, new_position|
          image = images[current_index]
          image.update!(position: new_position)
        end
      end
    end
  end
end
