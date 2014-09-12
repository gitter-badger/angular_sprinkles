require 'spec_helper'

describe AngularSprinkles::Directive::Input do
  let(:args) { { key: 'value' } }

  subject { described_class.new(args) }

  it 'turns the args hash into a jsonified data hash' do
    expect(subject.attributes).to eq({ data: { key: "\"value\"" } })
  end
end
