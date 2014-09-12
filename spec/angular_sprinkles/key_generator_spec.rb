require 'spec_helper'

describe AngularSprinkles::KeyGenerator do
  let(:counter) { Object.new }
  let(:inc) { 1 }
  let(:object) { Object.new }

  before do
    allow(counter).to receive(:inc).with(object.class).and_return(inc)
  end

  subject { described_class.new(counter: counter) }

  it 'returns a suitable variable name' do
    expect(subject.call(object)).to eq("#{object.class}_#{inc}")
  end
end
