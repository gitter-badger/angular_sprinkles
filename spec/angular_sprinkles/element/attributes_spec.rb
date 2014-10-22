require 'spec_helper'

describe AngularSprinkles::Element::Attributes do
  let(:something) { double(attributes: {}) }
  let(:name) { something }
  let(:input) { something }
  let(:options) { something }
  let(:content) { 'content' }
  let(:tag) { :div }

  subject do
    described_class.new([name, input, options], content: content, tag: tag)
  end

  it 'returns the list of arguments required for the content_tag' do
    expect(subject.to_content_tag).to eq([tag, content, {}])
  end

end
