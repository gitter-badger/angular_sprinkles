require 'spec_helper'

describe AngularSprinkles::Directive::Controller do
  let(:name) { double }
  let(:object_wrapper) { double }
  let(:bind_json_wrapper) { double }
  let(:call_json_wrapper) { double }

  subject do
    described_class.new({
      name: name,
      object_wrapper: object_wrapper,
      bind_json_wrapper: bind_json_wrapper,
      call_json_wrapper: call_json_wrapper
    })
  end

  describe "#bind" do
    it "wraps the controller name" do
      attribute = double

      expect(object_wrapper).to receive(:new).with(name, attribute, bind_json_wrapper)
      subject.bind(attribute)

      expect(object_wrapper).to receive(:new).with(name, nil, bind_json_wrapper)
      subject.bind
    end
  end

  describe "#call" do
    it "wraps the controller name" do
      function = double
      input = [double, double]

      expect(object_wrapper).to receive(:new).with(name, function, input, call_json_wrapper)
      subject.call(function, *input)
    end
  end
end
