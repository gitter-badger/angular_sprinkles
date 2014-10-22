require 'spec_helper'

describe AngularSprinkles::Directive::Controller do
  let(:base) { double }
  let(:object_wrapper) { double }
  let(:bind_json_wrapper) { double }
  let(:call_json_wrapper) { double }

  subject do
    described_class.new({
      base: base,
      object_wrapper: object_wrapper,
      bind_json_wrapper: bind_json_wrapper,
      call_json_wrapper: call_json_wrapper
    })
  end

  describe "#bind" do
    it "wraps the controller base" do
      attribute = double

      expect(object_wrapper).to receive(:new).with(base, attribute, bind_json_wrapper)
      subject.bind(attribute)

      expect(object_wrapper).to receive(:new).with(base, nil, bind_json_wrapper)
      subject.bind
    end
  end

  describe "#call" do
    it "wraps the controller base" do
      function = double
      input = [double, double]

      expect(object_wrapper).to receive(:new).with(base, function, input, call_json_wrapper)
      subject.call(function, *input)
    end
  end
end
