RSpec::Matchers.define :have_a_balance_of do |amount|
  chain(:as_of) { |date| @as_of_date = date }
  match { |account| account_balance(account) == amount }
  failure_message { |account| super() + failure_reason(account) }
  #expect(...).to (...)
  #super() call the method inherited from parent wothout passing args
  failure_message_when_negated { |account| super() + failure_reason(account) }
  #expect(...).not_to (...)

  private

  def failure_reason(account)
    ", but had a balance of #{account_balance(account)}"
  end

  def account_balance(account)
    if @as_of_date
      account.balance_as_of(@as_of_date)
    else
      account.current_balance
    end
  end
end