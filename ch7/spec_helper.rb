RSpec.configure do |rspec|
  rspec.alias_example_group_to :pdescribe, pry: true
  rspec.alias_example_group_to :pit, pry: true
  #add the pry: true metasata to its respective expmple group or single example

  rspec.after(:example, pry: true) do |ex|
    require 'pry'
  end
  #require pry only after examples that have the :pry metadata defined
end