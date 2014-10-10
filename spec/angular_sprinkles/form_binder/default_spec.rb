require 'spec_helper'

describe AngularSprinkles::FormBinder::Default do
  let(:method) { ->(arg1, arg2, arg3 = {}, arg4 = {}, arg5 = {}) {} }
  let(:args) { [:attribute, :something_else] }
  let(:attribute_binding) { double }
  let(:object) { double(bind: attribute_binding) }
  let(:params) { { method: method, args: args, object: object } }

  it 'returns the arguments with the second one augmented' do
    augmented_args = described_class.new(params).call

    expect(augmented_args[0]).to eq(:attribute)
    expect(augmented_args[1]).to eq(:something_else)
    expect(augmented_args[2]).to eq({})
    expect(augmented_args[3]).to eq({})
    expect(augmented_args[4]).to eq({ "ng-model" => attribute_binding })
  end
end
