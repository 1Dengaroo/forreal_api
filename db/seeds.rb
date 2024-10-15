# frozen_string_literal: true

property = Property.create!(title: 'Cozy Cottage', description: 'A lovely cottage in the countryside.')

property.images.create!(image_url: 'https://www.image1.com', position: 0)
property.images.create!(image_url: 'https://www.image2.com', position: 1)
property.images.create!(image_url: 'https://www.image3.com', position: 2)
