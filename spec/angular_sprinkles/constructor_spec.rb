require 'spec_helper'

describe AngularSprinkles::Constructor do
  let(:wrapper) { ->(string){ "%%#{string}%%" } }
  let(:collection) { [] }

  subject { described_class.new(json_wrapper: wrapper, collection: collection) }

  it 'turns objects into a wrapped js string' do
    expect(subject.to_json).to include("%%#{collection.to_json}%%")
  end
end
