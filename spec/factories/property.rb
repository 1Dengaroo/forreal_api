# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    title { 'Test Property' }
    description { 'A test property' }
  end
end
