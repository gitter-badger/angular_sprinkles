require 'spec_helper'

describe AngularSprinkles::ModelDecorator do
  let(:key) { 'key' }
  let(:object) { Object.new }
  let(:attribute) { :a }
  let(:json_wrapper) { ->(key, attribute) { "#{key}+#{attribute}"} }
  let(:object_wrapper) { Array }

  subject do
    described_class.new(key: key, object: object, json_wrapper: json_wrapper, object_wrapper: object_wrapper)
  end

  describe "#bind" do
    it 'returns a binding object' do
      expect(object_wrapper).to receive(:new).with(key, attribute, json_wrapper)
      subject.bind(attribute)

      expect(object_wrapper).to receive(:new).with(key, nil, json_wrapper)
      subject.bind
    end
  end

end
