RSpec.describe 'test' do
  it do
    expect{ raise 'boom' }.to raise_error('boom')
  end

  it do
    expect{ 'hello'.world }.to raise_error(an_object_having_attributes(name: :world))
  end

  it do
    expect{ 'hello'.world }.to raise_error(NoMethodError) do |ex|
      expect(ex.name).to eq(:world)
    end
  end

  it do
    expect{ throw :found }.to throw_symbol(:found)
  end

  it do
    expect { throw :found, 10 }.to throw_symbol(:found, a_value > 9)
  end

  it do
    def just_yield
      yield
    end

    expect{ |block_checker| just_yield(&block_checker)}.to yield_control
  end

  it do
    expect{ |block| 2.times(&block) }.to yield_control.twice
  end

  it do
    def just_yield_these(*args)
      yield(*args)
    end

    expect { |block| just_yield_these(10, 'food', Math::PI, &block)}.to yield_with_args(10, 'food', a_value_within(0.1).of(3.14))
    expect { |block| just_yield_these(&block) }.to yield_with_no_args

  end

  it do
    expect { |block| ['football', 'barstool'].each_with_index(&block)}.to yield_successive_args(
      [/foo/, 0], [a_string_starting_with('bar'), 1]
    )
  end

  it do
    array = [1, 2, 3]
    expect { array << 4 }.to change { array.size }
  end

  it do
    array = [1, 2, 3]
    expect { array.concat([1, 2, 3]) }.to change { array.size }.by(3)
    expect { array.concat([1, 2, 3]) }.to change { array.size }.by_at_least(2)
    expect { array.concat([1, 2, 3]) }.to change { array.size }.by_at_most(4)
    array = [1, 2, 3]
    expect { array << 4 }.to change { array.size }.from(3)
  end

  it do
    x = 5
    expect { x += 10 }.to change { x }.from(a_value_between(2, 7)).to(a_value_between(12, 17))
  end

  it do
    expect { system('echo OK') }.to output("OK\n").to_stdout_from_any_process
  end
end