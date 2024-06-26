ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    include AbstractController::Translation
    include Devise::Test::IntegrationHelpers
    include FactoryBot::Syntax::Methods

    parallelize(workers: :number_of_processors)
  end
end
