RSpec.describe 'Expense Tracker API', :db do
  include Rack::Test::Methods

  def app
    ExpenseTracker::API.new
  end
end