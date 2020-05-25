# Saint Bernard Ski Resort Transfer Form App

### Author

Robert Garcia

### Purpose

This web-app allowed me to practice handling associations with Ruby on Rails.

#### Background

As a Saint Bernard software developer, you have the mission to create a simple prototype that closes the deal. This prototype should render an emergency summary template, parsing and interpolating different placeholders from persisted data. The prototype must be compatible with the Saint Bernard app, a Ruby on Rails web application using SQLite for data storage and Bootstrap 3 for the UI.

#### Challenge

As an emergency staff, and after selecting a patient from a list, I want to view the corresponding emergency summary with the option to print.

### Dependencies

* ruby 2.6.3
* sqlite3
* rails ~> 5.2.4
* sass-rails ~> 5.0
* Bootstrap 3 - utilized via CDN
* faker

### Development

To get started locally follow these steps:

1. git clone repo
2. cd repo
3. bundle install
4. `rails db:create db:migrate` - get your database up and running
5. `rails db:seed` - for seed data
6. `rails server` - check out the app

### Test Suite

* `rspec` - runs the entire test suite.
* `rspec spec/file_path` - runs the individual spec.

#### Test Suite Dependencies

* faker
* rspec-rails ~> 3.5
* factory_bot
* capybara ~> 3.0
* selenium-webdriver
* chromedriver-helper
