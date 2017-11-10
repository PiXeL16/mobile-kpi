require 'rspec'
require "webmock/rspec"

WebMock.disable_net_connect!

require_relative "/../app/mobile_kpi"

RSpec.configure do |config|
  config.color = true
  config.order = 'random'
  config.before(:each) do |current_test|
    fake_db = "fake_db"
    allow(MobileKPI::Database).to receive(:database).and_return(fake_db)
  end
end
