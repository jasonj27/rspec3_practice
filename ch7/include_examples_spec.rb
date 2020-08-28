RSpec.descrbe HashKVStore do
  include_examples 'KV store', HashKVStore
  #this will be replaced of the doubled include_examples
  include_examples 'KV store', FileKVStore
end