require 'spec_helper'

describe AngularSprinkles::Element::Name do
  let(:args) { [:first, :second, :third] }

  subject { described_class.new(args) }

  it 'turns the args hash into an empty data hash' do
    expect(subject.attributes).to eq({ data: { "first" => '', "second" => '', "third" => '' } })
  end
end
