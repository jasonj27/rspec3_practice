class CookieRecipe
  attr_reader :ingredients

  def initialize
    @ingredients = [:butter, :milk, :flour, :sugar, :eggs, :chocolate_late]
  end
end

RSpec.describe CookieRecipe, '#ingredients' do
  subject { CookieRecipe.new.ingredients }
  #equal to let(:subject) {...}

  it { is_expected.to include(:butter, :milk, :eggs) }
  #expect(subject)

  it { is_expected.not_to include(:fish_oil) }
end 