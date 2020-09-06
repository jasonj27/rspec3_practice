RSpec.describe "Block implementations that provide responses" do
  let(:test_double) { double }

  it "can return a value" do
    allow(test_double).to receive(:message).and_return(17)

    expect(test_double.message).to eq(17)
  end

  it "can raise an error" do
    allow(test_double).to receive(:message).and_raise("boom")

    expect { test_double.message }.to raise_error(/boom/)
  end

  it "can yield a value" do
    allow(test_double).to receive(:message).and_yield(1)

    expect { |b| test_double.message(&b) }.to yield_with_args(1)
  end

  it "can throw a symbol" do
    allow(test_double).to receive(:message).and_throw(:foo)

    expect { test_double.message }.to throw_symbol(:foo)
  end
end

RSpec.describe "Block implementations that check calls" do
  let(:test_double) { double }

  it "can constrain arguments" do
    allow(test_double).to receive(:message).with(:valid_arg)
    allow(test_double).to receive(:message).with(:invalid_arg).and_raise("invalid_arg")

    expect { test_double.message(:valid_arg) }.not_to raise_error
    expect { test_double.message(:invalid_arg) }.to raise_error(/invalid_arg/)
  end

  it "can count how many times the message was received" do
    receive_count = 0

    allow(test_double).to receive(:message) do
      receive_count += 1  
    end

    test_double.message
    test_double.message

    expect(receive_count).to eq(2)
  end

  it "can constrain the order messages were received in" do
    sequence = []

    allow(test_double).to receive(:message_1) do
      sequence << :message_1
    end

    allow(test_double).to receive(:message_2) do
      sequence << :message_2
    end

    test_double.message_1
    test_double.message_2
    test_double.message_1

    expect(sequence).to eq([:message_1, :message_2, :message_1])
  end
end