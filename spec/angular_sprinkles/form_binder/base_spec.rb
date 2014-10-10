require 'spec_helper'

describe AngularSprinkles::FormBinder::Base do
  let(:method) { ->(name, value, *opts) {} }
  let(:args) { [:attribute, {}] }
  let(:attribute_binding) { double }
  let(:object) { double(bind: attribute_binding) }
  let(:params) { { method: method, args: args, object: object } }

  subject { described_class.new(params) }

  it 'raises NotImplementedError for augment_args' do
    expect { subject.call }.to raise_error(NotImplementedError)
  end

  context "when not enough arguments are given" do
    let(:args) { [:attribute] }

    it "returns the args so that the original method will raise an exception" do
      expect(subject.call).to eq(args)
    end
  end

  context "when augment_args is implemented by a subclass" do
    let!(:duped_args) { args.dup }

    before do
      subject.define_singleton_method(:augment_args, -> {})
    end

    it 'does not modify the original params' do
      augmented_args = subject.call

      expect(args).to eq(duped_args)
      expect(args).not_to eq(augmented_args)
    end
  end
end
