# frozen_string_literal: true

class Property < ApplicationRecord
  has_many :images, -> { order(:position) }, dependent: :destroy, inverse_of: :property
  validates :title, presence: true
  validates :description, presence: true
end
