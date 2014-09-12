require 'spec_helper'

describe AngularSprinkles::Directive::Options do
  let(:args) { { key: 'value' } }

  subject { described_class.new(args) }

  it 'returns the args as they were' do
    expect(subject.attributes).to eq(args)
  end
end
