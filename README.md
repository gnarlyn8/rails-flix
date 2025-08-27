# Flix - Movie Review Application

git
A Rails-based movie review and rating application where users can browse movies, read reviews, and manage their favorites.

## Features

- User authentication and profiles
- Movie browsing with details (title, director, duration, genre)
- User reviews and ratings with star system
- Favorite movies functionality
- Genre categorization
- Responsive Bootstrap UI

## Technologies

- **Backend**: Ruby on Rails 8.0.2
- **Frontend**: ERB templates, Bootstrap CSS
- **Database**: SQLite (development), PostgreSQL (production)
- **Authentication**: bcrypt for secure passwords
- **Asset Pipeline**: Propshaft with CSS bundling
- **JavaScript**: Stimulus with importmaps

## Getting Started

### Prerequisites

- Ruby 3.x
- Rails 8.0.2
- SQLite3 (development)

### Installation

1. Clone the repository
2. Run `bundle install`
3. Run `bin/rails db:create db:migrate db:seed`
4. Start the server with `bin/dev`

The application will be available at `http://localhost:3000`

## Production

The application is deployed on Heroku and available [here](https://rails-flix-daf7127169ad.herokuapp.com/)

## Development

- Run tests: `bin/rails test`
- Code linting: `bin/rubocop`
- Security scanning: `bin/brakeman`
