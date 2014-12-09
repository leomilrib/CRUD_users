ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'capybara/dsl'
require File.expand_path '../../app.rb', __FILE__

ActiveRecord::Base.logger.level = 1

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c|
  c.include RSpecMixin
  c.include Capybara::DSL
}

Capybara.app = Sinatra::Application
