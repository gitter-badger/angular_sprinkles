require 'spec_helper'

describe AngularSprinkles::Decorators::Bind do
  class StubObject
    attr_reader :some_attr

    def initialize(some_attr)
      @some_attr = some_attr
    end
  end

  class StubContext
    def bind(*args)
    end
  end

  before do
    StubContext.any_instance.stub(bind: true)
  end

  let(:context) { StubContext.new }
  let(:context_proc) { ->{ context } }

  let(:attr) { :brewhouse }
  let(:key) { 'software' }
  let(:object) { StubObject.new(attr) }

  subject { AngularSprinkles::Decorators::Bind.new(object, key, context_proc) }

  describe '#bind' do
    context 'when no arguments are passed' do
      it 'creates the necessary object binding' do
        expect(context).to receive(:bind)
        subject.bind
      end
    end

    context 'when more than one argument is passed' do
      it 'creates the necessary object binding' do
        expect(context).to receive(:bind)
        subject.bind
      end

      # it 'creates additional bindings' do
      #   subject.bind(attr)
      # end

    end
  end

end
