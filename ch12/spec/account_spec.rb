require 'account'
require 'support/matchers'
RSpec::Expectations.configuration.
include_chain_clauses_in_custom_matcher_descriptions = true
#for custom matcher description and failure messages from methods defined using chain, deafult: false
#https://www.rubydoc.info/gems/rspec-expectations/RSpec/Expectations/Configuration#include_chain_clauses_in_custom_matcher_descriptions%3F-instance_method

RSpec.describe '`have_a_balance_of(amount)`' do
  let(:account) { Account.new('Checking') }

  before do
    account.expenses << Expense.new(Date.new(2017, 06, 10), 10)
    account.expenses << Expense.new(Date.new(2017, 06, 15), 20)
  end

  it 'passes when the balance matches' do
    expect(account).to have_a_balance_of(30).and have_attributes(name: 'Checking')
  end

  it "fails when a date's balance does not match" do
    expect(account).to have_a_balance_of(15).as_of(Date.new(2017, 06, 12))
  end
end
