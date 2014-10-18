require 'spec_helper'

describe AngularSprinkles::KeyGenerator do
  let(:counter) { AngularSprinkles::Counter.new }
  let(:cache) { AngularSprinkles::Cache.new }
  let(:inc) { 1 }
  let(:object) { double(class: AngularSprinkles) }

  subject { described_class.new(counter: counter, cache: cache) }

  it "returns a suitable variable name" do
    expect(subject.call(object)).to eq("#{object.class}_#{inc}")
  end

  it "it substitutes :: for __ in nested classes" do
    expect(subject.call(subject)).to eq("AngularSprinkles__KeyGenerator_#{inc}")
  end

  it "returns the same key if the object is used twice" do
    expect(subject.call(object)).to eq("#{object.class}_#{inc}")
    expect(subject.call(object)).to eq("#{object.class}_#{inc}")
  end
end
