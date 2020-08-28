module APIHelpers
  include Rack::Test::Methods

  def app
    ExpenseTracker::API.new
  end
end

RSpec.configure do |config|
  config.include APIHelpers
end

RSpec.describe 'Expense Tracker API', :db do

end