require 'spec_helper'

describe AngularSprinkles::Context do
  let(:key_generator) { double }
  let(:constructor) { double }
  let(:constructor_collection) { double }
  let(:view_context) { double }

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
