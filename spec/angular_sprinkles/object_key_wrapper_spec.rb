require 'spec_helper'

describe AngularSprinkles::ObjectKeyWrapper do
  let(:wrapper1) { ->(a) { "%%#{a}%%" } }
  let(:wrapper2) { ->(a, b) { "#{a}+#{b}" } }

  let(:arg1) { "a" }
  let(:arg2) { "b" }

  it 'wraps objects on #to_json' do
    json1 = described_class.new(arg1, wrapper1).to_json
    expect(json1).to eq("%%#{arg1}%%")

    json2 = described_class.new(arg1, arg2, wrapper2).to_json
    expect(json2).to eq("#{arg1}+#{arg2}")
  end
end
