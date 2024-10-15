# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :property
  validates :position, numericality: { only_integer: true }
  validates :image_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
