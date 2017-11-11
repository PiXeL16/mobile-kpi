require "rspec"
require "webmock/rspec"

RSPEC_ROOT = File.dirname __FILE__

WebMock.disable_net_connect!

require_relative "../app/mobile_kpi"

RSpec.configure do |config|
  config.order = "random"
  config.before(:each) do |current_test|
    fake_db = "fake_db"
    allow(MobileKPI::Database).to receive(:database).and_return(fake_db)
    allow(MobileKPI::Database).to receive(:store_rating).and_return(nil)
  end
end
