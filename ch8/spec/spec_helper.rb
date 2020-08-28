RSpec.configure do |config|
  config.define_derived_metadata(file_path:/spec\/unit/) do |meta|
    meta[:fast] = true
  end

  config.define_derived_metadata(type: :model) do |meta|
  end

  config.filter_run_excluding :jruby_only unless RUBY_PLATFORM == 'java'
  #run examples with :jruby_only on jruby platform
end