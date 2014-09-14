require 'spec_helper'

describe AngularSprinkles::KeyGenerator do
  let(:counter) { double(inc: inc) }
  let(:inc) { 1 }
  let(:object) { double }

  subject { described_class.new(counter: counter) }

  it 'returns a suitable variable name' do
    expect(subject.call(object)).to eq("#{object.class}_#{inc}")
  end
end
