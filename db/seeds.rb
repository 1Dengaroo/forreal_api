# frozen_string_literal: true

# Clear existing data (optional, useful for reseeding)
Property.destroy_all
Image.destroy_all

# Property 1
property1 = Property.create!(
  title: 'Cozy Cottage',
  description: 'A lovely cottage in the countryside.'
)

property1.images.create!(image_url: 'https://www.image1.com', position: 0)
property1.images.create!(image_url: 'https://www.image2.com', position: 1)
property1.images.create!(image_url: 'https://www.image3.com', position: 2)

# Property 2
property2 = Property.create!(
  title: 'Modern Apartment',
  description: 'A stylish apartment in the city center.'
)

property2.images.create!(image_url: 'https://www.image4.com', position: 0)
property2.images.create!(image_url: 'https://www.image5.com', position: 1)

# Property 3
property3 = Property.create!(
  title: 'Beach House',
  description: 'A beautiful house by the beach.'
)

property3.images.create!(image_url: 'https://www.image6.com', position: 0)
property3.images.create!(image_url: 'https://www.image7.com', position: 1)
property3.images.create!(image_url: 'https://www.image8.com', position: 2)
property3.images.create!(image_url: 'https://www.image9.com', position: 3)

# Property 4
property4 = Property.create!(
  title: 'Mountain Cabin',
  description: 'A rustic cabin in the mountains.'
)

property4.images.create!(image_url: 'https://www.image10.com', position: 0)

# Property 5
property5 = Property.create!(
  title: 'Luxury Villa',
  description: 'An exclusive villa with a private pool.'
)

property5.images.create!(image_url: 'https://www.image11.com', position: 0)
property5.images.create!(image_url: 'https://www.image12.com', position: 1)
property5.images.create!(image_url: 'https://www.image13.com', position: 2)

# Property 6
property6 = Property.create!(
  title: 'Urban Loft',
  description: 'A chic loft in the heart of downtown.'
)

property6.images.create!(image_url: 'https://www.image14.com', position: 0)
property6.images.create!(image_url: 'https://www.image15.com', position: 1)

# Property 7
property7 = Property.create!(
  title: 'Country Farmhouse',
  description: 'A spacious farmhouse surrounded by nature.'
)

property7.images.create!(image_url: 'https://www.image16.com', position: 0)
property7.images.create!(image_url: 'https://www.image17.com', position: 1)
property7.images.create!(image_url: 'https://www.image18.com', position: 2)
property7.images.create!(image_url: 'https://www.image19.com', position: 3)
property7.images.create!(image_url: 'https://www.image20.com', position: 4)

# Property 8
property8 = Property.create!(
  title: 'Lake House',
  description: 'A serene house with lake views.'
)

property8.images.create!(image_url: 'https://www.image21.com', position: 0)
property8.images.create!(image_url: 'https://www.image22.com', position: 1)

# Property 9
property9 = Property.create!(
  title: 'Desert Retreat',
  description: 'An oasis in the desert with stunning sunsets.'
)

property9.images.create!(image_url: 'https://www.image23.com', position: 0)
property9.images.create!(image_url: 'https://www.image24.com', position: 1)
property9.images.create!(image_url: 'https://www.image25.com', position: 2)

# Property 10
property10 = Property.create!(
  title: 'Forest Bungalow',
  description: 'A quiet bungalow nestled in the woods.'
)

property10.images.create!(image_url: 'https://www.image26.com', position: 0)
property10.images.create!(image_url: 'https://www.image27.com', position: 1)
