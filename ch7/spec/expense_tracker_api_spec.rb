RSpec.shared_context 'API helpers' do
  include Rack::Test::Methods

  def app
    ExpenseTracker::API.new
  end

  before do
    basic_authorize 'test_user', 'test_password'
  end
end

RSpec.configure do |config|
  config.include_context 'API helpers'
end
#uses include_context in RSpec.configure (all example groups)

RSpec.describe 'Expense Tracker API', :db do
  include_context 'API helpers'
  #uses include_context in specific example groups
end