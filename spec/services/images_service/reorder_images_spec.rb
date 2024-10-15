# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesService::ReorderImages, type: :service do
  let(:property) { create(:property) }
  let!(:image1) { create(:image, property: property, position: 0) }
  let!(:image2) { create(:image, property: property, position: 1) }
  let!(:image3) { create(:image, property: property, position: 2) }

  describe '#call' do
    context 'when image_positions is empty' do
      it 'returns an error message' do
        service = described_class.new(property, [])
        result = service.call

        expect(result[:success]).to be_falsey
        expect(result[:message]).to eq('image_positions cannot be empty')
        expect(result[:status]).to eq(:bad_request)
      end
    end

    context 'when image_positions is not a permutation of valid indices' do
      it 'returns an error for invalid positions' do
        service = described_class.new(property, [0, 1])
        result = service.call

        expect(result[:success]).to be_falsey
        expect(result[:message]).to eq('image_positions must be a permutation of [0, 1, 2]')
        expect(result[:status]).to eq(:unprocessable_entity)
      end

      it 'returns an error for duplicate indices' do
        service = described_class.new(property, [0, 1, 1])
        result = service.call

        expect(result[:success]).to be_falsey
        expect(result[:message]).to eq('image_positions must be a permutation of [0, 1, 2]')
        expect(result[:status]).to eq(:unprocessable_entity)
      end

      it 'returns an error for indices out of range' do
        service = described_class.new(property, [0, 1, 3])
        result = service.call

        expect(result[:success]).to be_falsey
        expect(result[:message]).to eq('image_positions must be a permutation of [0, 1, 2]')
        expect(result[:status]).to eq(:unprocessable_entity)
      end
    end

    context 'when image_positions are valid' do
      it 'reorders the images successfully' do
        # Suppose we want to move:
        # - Image at current index 2 to new position 0
        # - Image at current index 0 to new position 1
        # - Image at current index 1 to new position 2
        # So, image_positions = [2, 0, 1]
        service = described_class.new(property, [2, 0, 1])
        result = service.call

        expect(result[:success]).to be_truthy
        expect(result[:message]).to eq('Order updated successfully')
        expect(result[:status]).to eq(:ok)

        # After reordering:
        # - image3 (index 2) should be at position 0
        # - image1 (index 0) should be at position 1
        # - image2 (index 1) should be at position 2
        expect(image3.reload.position).to eq(0)
        expect(image1.reload.position).to eq(1)
        expect(image2.reload.position).to eq(2)
      end
    end
  end
end
