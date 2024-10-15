# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    image_url { 'https://example.com/image.jpg' }
    position { 0 }
    association :property
  end
end
