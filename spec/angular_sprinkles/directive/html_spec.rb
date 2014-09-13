require 'spec_helper'

describe AngularSprinkles::Directive::Html do
  let(:args) { { key: 'value', tag: 'a' } }

  subject { described_class.new(args) }

  it 'returns the args as they were' do
    expect(subject.attributes).to eq({ key: 'value' })
    expect(subject.tag).to eq('a')
  end
end
