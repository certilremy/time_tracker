ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'capybara/rspec'

# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  # This block must be here, do not combine with the other `before(:each)` block.
  # This makes it so Capybara can see the database.
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end

  def login(user)
    session[:user_id] = user.id
  end

  def sign_up_with(username)
    visit signup_path
    fill_in 'username', with: username
    click_button 'Sign up'
  end

  def sign_in
    user = create(:user)
    visit signin_path
    fill_in 'username', with: user.username
    click_button 'LOGIN'
  end

  def logout
    visit transactions_path
    click_link 'Log out'
  end

  def create_transactions
    visit new_transaction_path
    fill_in 'name', with: 'First transaction'
    fill_in 'Amount of hours spent', with: 1
    click_button 'ADD TIME'
  end

  def create_fake_transactions
    visit new_transaction_path
    fill_in 'name', with: ''
    fill_in 'Amount of hours spent', with: ''
    click_button 'ADD TIME'
  end

  def add_group_with(name)
    visit new_group_path
    fill_in 'Group name', with: name
    click_button 'ADD GROUP'
  end
end
