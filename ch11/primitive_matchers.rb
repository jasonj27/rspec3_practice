RSpec.describe 'test' do
  it do
    expect(["", Regexp]).not_to include(an_object_eq_to String)
  end

  it do
    expect(1).to be == 1
  end

  it do
    expect(1).to be < 2
  end

  it do
    expect(String).to be === 'a string'
  end

  it do
    expect(/foo/).to be =~ 'food'
  end

  it do
    squares = 1.upto(4).map{ |i|i*i }
    expect(squares).to include(a_value > 15)
  end

  it do
    expect(0.1 + 0.2).to be_within(0.0001).of(0.3)
  end

  it do
    town_population = 1237
    expect(town_population).to be_within(25).percent_of(1000)
    expect(town_population).to be_between(750, 1250)
  end

  it do
    expect([]).to be_empty
  end

  it do
    hash = {
      name: 'Harry Potter', age: 17, house: 'Gryffindor'
    }
    expect(hash).to have_key(:age)
  end

  it do
    expect(1).to satisfy{ |number|number.odd? }
  end

  it do
    expect([1, 2, 3]).to include(an_object_satisfying(&:even?))
  end
end