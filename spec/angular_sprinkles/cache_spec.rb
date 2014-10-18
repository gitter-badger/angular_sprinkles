require 'spec_helper'

describe AngularSprinkles::Cache do
  let(:key) { 'key' }
  let(:content) { Object.new }

  subject { described_class.new }

  it 'can set a key' do
    expect(subject.set?(key)).to eq(false)

    subject.set(key)

    expect(subject.set?(key)).to eq(true)
  end

  it 'can get a key' do
    subject.set(key, content)

    expect(subject.get(key)).to be(content)
  end
end
