require 'spec_helper'

describe AngularSprinkles::Context do
  let(:key_generator) { Object.new }
  let(:constructor) { Object.new }
  let(:constructor_collection) { Object.new }
  let(:view_context) { Object.new }

  subject do
    described_class.new({
      key_generator: key_generator,
      constructor_collection: constructor_collection,
      constructor: constructor
    })
  end

  it 'initializes a context wrapper' do
    expect(subject.key_generator).to be(key_generator)
    expect(subject.constructor).to be(constructor)
    expect(subject.constructor_collection).to be(constructor_collection)
  end
end
