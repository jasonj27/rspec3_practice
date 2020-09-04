RSpec::Matchers.alias_matcher :an_admin, :be_an_admin
RSpec::Matchers.alias_matcher :an_admin, :be_an_admin do |old_description|
  old_description.sub('be an admin', 'a superuser')
end
RSpec::Matchers.define :split_infinitives do
  match { |_| false }
end
RSpec::Matchers.define_negated_matcher :avoid_splitting_infinitives, :split_infinitives
RSpec::Matchers.define_negated_matcher :start_with_something_besides, :start_with
RSpec::Matchers.define_negated_matcher :end_with_something_besides, :end_with

RSpec.describe 'custom matchers' do
  it do
    results = [Math::PI]
    expect(results).to start_with a_value_within(0.1).of(Math::PI)
  end

  it do
    correct_grammar = 'to boldly split infinitives'
    expect(correct_grammar).to avoid_splitting_infinitives
  end

  it do
    expect('blazingly').to start_with_something_besides('a').and end_with_something_besides('z')
  end
end