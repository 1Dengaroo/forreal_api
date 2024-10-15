# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesService::ReorderImages, type: :service do
  let(:property) { create(:property) }
  let!(:image1) { create(:image, property: property, position: 0) }
  let!(:image2) { create(:image, property: property, position: 1) }
  let!(:image3) { create(:image, property: property, position: 2) }

  describe '#call' do
    context 'when image_ids is empty' do
      it 'returns an error message' do
        service = described_class.new(property, [])
        result = service.call

        expect(result[:success]).to be_falsey
        expect(result[:message]).to eq('image_ids cannot be empty')
        expect(result[:status]).to eq(:bad_request)
      end
    end

    context 'when the number of image_ids does not match the number of property images' do
      it 'returns an error for mismatched image count' do
        service = described_class.new(property, [image1.id])
        result = service.call

        expect(result[:success]).to be_falsey
        expect(result[:message]).to eq('You must provide exactly 3 image IDs')
        expect(result[:status]).to eq(:unprocessable_entity)
      end
    end

    context 'when the image_ids do not match the property image set' do
      it 'returns an error for mismatched image IDs' do
        other_image = create(:image) # Image not belonging to the property
        service = described_class.new(property, [image1.id, image2.id, other_image.id])
        result = service.call

        expect(result[:success]).to be_falsey
        expect(result[:message]).to eq("Image IDs do not match the property's image set")
        expect(result[:status]).to eq(:unprocessable_entity)
      end
    end

    context 'when there are duplicate image_ids' do
      it 'returns an error for duplicate image IDs' do
        service = described_class.new(property, [image1.id, image1.id, image2.id])
        result = service.call

        expect(result[:success]).to be_falsey
        expect(result[:message]).to eq('Duplicate image IDs are not allowed')
        expect(result[:status]).to eq(:unprocessable_entity)
      end
    end

    context 'when the image_ids are valid' do
      it 'reorders the images successfully' do
        service = described_class.new(property, [image2.id, image3.id, image1.id])
        result = service.call

        expect(result[:success]).to be_truthy
        expect(result[:message]).to eq('Order updated successfully')
        expect(result[:status]).to eq(:ok)

        # Ensure the images are reordered properly
        expect(image2.reload.position).to eq(0)
        expect(image3.reload.position).to eq(1)
        expect(image1.reload.position).to eq(2)
      end
    end
  end
end
