RSpec.describe 'My awsome gardening API' do
end

RSpec.describe Perennials::Rhubarb do
end

RSpec.describe Perennials do
end

Rspec.describe my_favorite_broccoli do
end

RSpec.describe Garden, 'in winter' do
end 

RSpec.describe WeatherStation, 'radar updates', uses_network: true do
end
#tag filtering

RSpec.describe Sprinkler do 
  it 'waters the garden', uses_serial_bus: true
end

RSpec.describe 'A kettle of water' do
  context 'when boiling' do #context is an alias for describe
    it 'can make tea'
  end
end

RSpec.describe PhoneNumberParser, 'parses phone numbers' do
  example 'in xxx-xxx-xxxx form'#example is an alias for it
  example 'in (xxx)xxx-xxxx form'
end

RSpec.describe 'Deprecations' do
  specify 'MyGem.config is deprecated in favor of My Gem.configure' #specify is an alias for it
end