# forREAL Technical Assessment - Andy Deng

## Dependencies

- Ruby: ruby-3.1.2
- SQLite

## Regular Setup

Make sure you're using the correct Ruby version (check the Gemfile for that)

Install dependencies using bundler:

```
bundle install
```

Setup your database:

```
bundle exec rails db:create db:migrate
```

## Testing

```
bundle exec rspec
```

## Lint

```
bundle exec rubocop
```

## Seed the Database

```
bundle exec rails db:seed
```

## Endpoints

### GET `/properties`

- **Description**: Retrieves a list of all properties.
- **Response**: A JSON array of property objects.

**Example Response**:

```json
[
  {
    "id": 1,
    "title": "Cozy Cottage",
    "description": "A lovely cottage in the countryside.",
    "created_at": "2024-10-15T18:11:44.385Z",
    "updated_at": "2024-10-15T18:11:44.385Z"
  },
  {
    "id": 2,
    "title": "Modern Apartment",
    "description": "A stylish apartment in the city center.",
    "created_at": "2024-10-15T18:11:44.394Z",
    "updated_at": "2024-10-15T18:11:44.394Z"
  },
  {
    "id": 3,
    "title": "Beach House",
    "description": "A beautiful house by the beach.",
    "created_at": "2024-10-15T18:11:44.399Z",
    "updated_at": "2024-10-15T18:11:44.399Z"
  }
]
```

### GET `/properties/:id/images`

- **Description**: Retrieves all images associated with the property specified by `:id`.
- **Response**: A JSON array of image objects containing `image_url` and `position`.

**Example Response**:

```json
[
  {
    "image_url": "https://www.image14.com",
    "position": 0
  },
  {
    "image_url": "https://www.image15.com",
    "position": 1
  }
]
```

### PUT `/properties/:id/images/update_order`

- **Description**: Updates the order of images for the property specified by `:id`.
- **Request Body**: A JSON object containing an array `image_positions`, which specifies the new order of images.

**Example Request Body**:

```json
Content-Type: application/json

{
  "image_positions": [4, 3, 2, 1, 0]
}
```

- **Response**: A JSON object confirming the update.

**Example Response**:

```json
{
  "message": "Order updated successfully"
}
```
