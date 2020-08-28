RSpec.configure do |rspec|
  rspec.alias_example_group_to :pdescribe, pry: true
  rspec.alias_example_group_to :pit, pry: true
  #add the pry: true metasata to its respective expmple group or single example

  rspec.after(:example, pry: true) do |ex|
    require 'pry'
  end
  #require pry only after examples that have the :pry metadata defined

  rspec.around(:example) do |ex|
    original_env = ENV.to_hash
    ex.run
    ENV.replace(original_env)
  end
  #global around hook, typically in spec_helper.rb or somewhere in spec/support 
end