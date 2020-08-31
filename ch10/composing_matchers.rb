require 'rspec/expectations'
include RSpec::Matchers

presidents = [
  {name: 'George Washington', birth_year: 1732},
  {name: 'John Adams', birth_year: 1735},
  {name: 'Thomas Jefferson', birth_year: 1743},
]

expect(presidents).to start_with(
  {name: 'George Washington', birth_year: a_value_between(1730, 1740)},
  {name: 'John Adams', birth_year: a_value_between(1730, 1740)}
)