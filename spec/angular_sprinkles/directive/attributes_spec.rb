require 'spec_helper'

describe AngularSprinkles::Directive::Attributes do
  let(:stub) { Object.new }

  let(:name) { stub }
  let(:input) { stub }
  let(:options) { stub }
  let(:content) { 'content' }
  let(:tag) { :div }

  before do
    allow(stub).to receive(:attributes).and_return({})
  end

  subject do
    described_class.new([name, input, options], content: content, tag: tag)
  end

  it 'returns the list of arguments required for the content_tag' do
    expect(subject.to_content_tag).to eq([tag, content, {}])
  end

end
