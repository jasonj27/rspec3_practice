require 'sinatra/base'
require 'json'
require_relative 'ledger'

module ExpenseTracker
  class API < Sinatra::Base
    def initialize(ledger: Ledger.new)
      @ledger = ledger
      super() #rest of init from sinatra
    end

    post '/expenses' do
      expense = JSON.parse(request.body.read) #request.body = {"some"=>"data"}
      result = @ledger.record(expense) #result = #<struct ExpenseTracker::RecordResult :success?=true, expense_id=417, error_message=nil>

      if result.success?
        JSON.generate('expense_id' => result.expense_id)
      else
        status 422
        JSON.generate('error' => result.error_message)
      end

    end

    get '/expenses/:date' do
      JSON.generate([])
    end

  end
end