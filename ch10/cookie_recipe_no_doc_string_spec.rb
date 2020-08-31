class CookieRecipe
  attr_reader :ingredients

  def initialize
    @ingredients = [:butter, :milk, :flour, :sugar, :eggs, :chocolate_late]
  end
end

RSpec.describe CookieRecipe, '#ingredients' do
  specify do #rspec will generate spec for document if description is empty
    expect(CookieRecipe.new.ingredients).to include(:butter, :milk, :eggs)
  end

  specify do
    expect(CookieRecipe.new.ingredients).not_to include(:fish_oil)
  end
end 