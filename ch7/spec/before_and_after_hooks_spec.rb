RSpec.describe MyApp::Configuration do
  before(:example) do #run before examples, favor for data cleanup
    @original_env = ENV.to_hash
  end

  after(:example) do
    ENV.replace(@original_env)
  end
  #guaranteed to run after examples, even if examples fails or before fails
end

RSpec.describe 'Web interface to my thermostat' do
  before(:context) do
    WebBrowser.launch
  end

  after(:context) do
    WebBrowser.shutdown
  end
end