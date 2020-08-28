module APIHelpers
  include Rack::Test::Methods

  def app
    ExpenseTracker::API.new
  end
end

RSpec.describe 'Expense Tracker API', :db do
  include APIHelpers

end