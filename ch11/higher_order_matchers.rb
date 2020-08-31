RSpec.describe 'Higher Order Matchers' do   
  it do
    expect('a string').to include('str')
  end

  it do
    expect([1, 2, 3]).to include(3)
  end

  it do
    hash = {name: 'Harry Potter', age: 17, house: 'Gryffindor'}
    expect(hash).to include(:name)
    expect(hash).to include(age: 17)
  end

  it do
    expecteds = [3, 2]
    expect([1, 2, 3]).to include(*expecteds)
  end

  it do
    expect('a string').to start_with('a str').and end_with('ng')
    expect([1, 2, 3]).to start_with(1, 2).and end_with((3))
  end

  it do
    numbers = [2, 4, 6, 8]
    expect(numbers).to all be_even
  end

  it do
    def evens_up_to(n = 0)
      0.upto(n).select(&:even?)    
    end

    RSpec::Matchers.define_negated_matcher :be_non_empty, :be_empty

    expect(evens_up_to).to be_non_empty.and all be_even
  end

  it do
    children = [
      {name: 'Coen', age: 6},
      {name: 'Daphen', age: 4},
      {name: 'Crosby', age: 2}
    ]

    expect(children).to match [
      {name: 'Coen', age: a_value > 5},
      {name: 'Daphen', age: a_value_between(3, 5)},
      {name: 'Crosby', age: a_value < 3}
    ]
  end

  it do
    expect('a string').to match(/str/)
  end

  it do
    children = [
      {name: 'Coen', age: 6},
      {name: 'Daphen', age: 4},
      {name: 'Crosby', age: 2}
    ]

    expect(children).to contain_exactly(
      {name: 'Daphen', age: a_value_between(3, 5)},
      {name: 'Crosby', age: a_value < 3},
      {name: 'Coen', age: a_value > 5}
    )
    #contain_exactly ignores order
  end

  it do
    require 'uri'
    uri = URI('http://github.com/rspec/rspec')
    expect(uri).to have_attributes(host: 'github.com', path: '/rspec/rspec')
  end
end