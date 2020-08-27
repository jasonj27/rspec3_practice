require 'sinatra/base'
require 'json'

module ExpenseTracker
  class API < Sinatra::Base
    def initialize(ledger: Ledger.new)
      @ledger = ledger
      super() #rest of init from sinatra
    end

    post '/expenses' do
      expense = JSON.parse(request.body.read) #request.body = {"some"=>"data"}
      result = @ledger.record(expense) #result = #<struct ExpenseTracker::RecordResult :success?=true, expense_id=417, error_message=nil>
      JSON.generate('expense_id' => result.expense_id)
    end

    get '/expenses/:date' do
      JSON.generate([])
    end

  end
end