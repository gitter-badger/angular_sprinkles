require 'spec_helper'

describe AngularSprinkles::FormBinder::CheckBox do
  let(:method) { ->(name, *opts) {} }
  let(:args) { [:attribute] }
  let(:attribute_binding) { double }
  let(:object) { double(bind: attribute_binding) }
  let(:params) { { method: method, args: args, object: object } }

  it 'returns the arguments with the second one augmented' do
    augmented_args = described_class.new(params).call
    expect(augmented_args.second["ng-model"]).to eq(attribute_binding)

    args.push({})
    augmented_args = described_class.new(params).call
    expect(augmented_args.second["ng-model"]).to eq(attribute_binding)

    args.push(1)
    augmented_args = described_class.new(params).call
    expect(augmented_args.second["ng-model"]).to eq(attribute_binding)

    args.push(1, 0)
    augmented_args = described_class.new(params).call
    expect(augmented_args.second["ng-model"]).to eq(attribute_binding)
  end
end
