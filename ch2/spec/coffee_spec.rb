class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00 + ingredients.size*0.25
  end
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.filter_run_when_matching(focus: true)
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'cost $1' do
    expect(coffee.price).to eq(1.00)
  end

  context 'with milk' do #contex 'with milk', focus:true do
    before { coffee.add :milk }

    it 'cost $1.25' do
      expect(coffee.price).to eq(1.25)
    end

    it 'is light in color'
    it 'is cooler than 200 degree Fahrenheit'
  end
end