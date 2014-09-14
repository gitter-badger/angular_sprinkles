require 'spec_helper'

describe AngularSprinkles::ContentYielder do
  let(:context) { ActionController::Base.new.view_context }
  let(:yield_to) { :yield_to }
  let(:content) { 'content' }

  subject { described_class.new(context: context, cache: cache, yield_to: yield_to) }

  context "when the content hasn't yet been set" do
    let(:cache) { double(set: true, set?: false) }
    let(:script_tag) { "<script>#{content.to_json}</script>" }

    it 'returns a script tag' do
      expect(subject.call(content)).to eq(script_tag)
    end

    it 'appends the content to sprinkles' do
      # this is an important side effect
      expect(context).
        to receive(:content_for).with(yield_to, script_tag)

      subject.call(content)
    end
  end

  context "when the content has been set" do
    let(:cache) { double(set: true, set?: true) }

    it 'returns an empty string' do
      expect(subject.call(content)).to eq('')
    end
  end

end
