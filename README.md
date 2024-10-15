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
