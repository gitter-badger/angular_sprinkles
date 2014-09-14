require 'spec_helper'

describe AngularSprinkles::ConstructorCollection do
  let(:json_wrapper) { ->{} }
  let(:stub) { "stub" }
  let(:object_wrapper) { double(new: stub) }

  subject { described_class.new(json_wrapper: json_wrapper, object_wrapper: object_wrapper) }

  it 'turns objects into a wrapped js string' do
    # add two items to the collection
    subject.push(1, 2)
    subject.push(1, 2)

    expect(subject.to_json).to eq("#{stub.to_json}\n#{stub.to_json}")
  end
end
