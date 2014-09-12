require 'spec_helper'

describe AngularSprinkles::Counter do

  subject { described_class.new }

  it 'increments the counter for classes' do
    expect(subject.inc(Object)).to eq(1)
    expect(subject.inc(Object)).to eq(2)
    expect(subject.inc(Array)).to eq(1)
    expect(subject.inc(Array)).to eq(2)
    expect(subject.inc(Array)).to eq(3)
    expect(subject.inc(described_class)).to eq(1)
  end
end
