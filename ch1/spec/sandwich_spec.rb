Sandwich = Struct.new(:taste, :toppings)

RSpec.describe 'An ideal sandwich' do
  before do 
    @sandwich = Sandwich.new('delicious', []) 
  end
  # do... end = {}

  it 'is delicious' do
    taste = @sandwich.taste

    expect(taste).to eq('delicious')
  end

  it 'let me add toppings' do
    @sandwich.toppings<<'chese'
    toppings = @sandwich.toppings

    expect(toppings).not_to be_empty
  end
end