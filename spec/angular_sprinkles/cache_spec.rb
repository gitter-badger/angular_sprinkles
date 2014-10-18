require 'spec_helper'

describe AngularSprinkles::Cache do
  let(:key) { 'key' }

  subject { described_class.new }

  it 'can set a key' do
    expect(subject.set?(key)).to eq(false)

    subject.set(key)

    expect(subject.set?(key)).to eq(true)
  end
end
