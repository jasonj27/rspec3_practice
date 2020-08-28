RSpec.configure do |config|
  config.define_derived_metadata(file_path:/spec\/unit/) do |meta|
    meta[:fast] = true
  end

  config.define_derived_metadata(type: :model) do |meta|
  end

  config.filter_run_excluding :jruby_only unless RUBY_PLATFORM == 'java'
  #run examples with :jruby_only on jruby platform

  config.filter_run :filter_tag
  #run only examples with provided tag
  #it will skip all examples when there's no match example

  config.filter_run_when_matching :filter_tag2
  #when tag provided, run examples with tag only
  #run all examples if there's no match example
end