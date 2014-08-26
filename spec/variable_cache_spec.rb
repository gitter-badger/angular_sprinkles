require 'spec_helper'

describe AngularSprinkles::VariableCache do
  let(:cache) { AngularSprinkles::VariableCache.new }
  let(:desired_result) { 'a.b.c' }

  it 'turns strings into symbolized arrays' do
    var = 'a.b.c'

    return_value = cache.yield_if_new(var) do |new_var|
      expect(new_var).to eq(desired_result)
    end

    expect(return_value).to eq(true)
  end

  it 'flattens nested arrays' do
    var = [:a, ['b', :c]]

    cache.yield_if_new(var) do |new_var|
      expect(new_var).to eq(desired_result)
    end
  end

  it 'turns single elements into arrays' do
    var = :a

    cache.yield_if_new(var) do |new_var|
      expect(new_var).to eq('a')
    end

    var = 'b'

    cache.yield_if_new(var) do |new_var|
      expect(new_var).to eq('b')
    end
  end

  it 'removes nils' do
    var = [:a, nil]

    cache.yield_if_new(var) do |new_var|
      expect(new_var).to eq('a')
    end
  end

  it 'prevents the block from running multple times' do
    some_lambda = -> { }
    expect(some_lambda).to receive(:call).twice

    cache.yield_if_new(:a) { |var| some_lambda.call }
    cache.yield_if_new(:a) { |var| some_lambda.call }
    cache.yield_if_new(:a) { |var| some_lambda.call }
    cache.yield_if_new(:b) { |var| some_lambda.call }
    cache.yield_if_new(:b) { |var| some_lambda.call }
  end
end
