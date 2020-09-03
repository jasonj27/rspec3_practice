class Water
  def self.elements
    [:oxygen, :hydrogen, :hydrogen]
  end
end

RSpec.describe Water do
  it 'is H2O' do
    expect(Water.elements).to include(:hydrogen, :hydrogen, :oxygen)
  end
end
