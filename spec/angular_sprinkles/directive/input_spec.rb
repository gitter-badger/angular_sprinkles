require "spec_helper"

describe AngularSprinkles::Directive::Input do
  let(:args) { { "key" => value } }

  subject { described_class.new(args) }

  context "when the value is a string" do
    let(:value) { "value" }

    it "does nothing to the value" do
      expect(subject.attributes).to eq({ data: args })
    end
  end

  context "when the value is not a string" do
    let(:value) { double(to_json: 1) }

    it "turns the args hash into a jsonified data hash" do
      expect(subject.attributes).to eq({ data: { "key" => 1 } })
    end
  end
end
