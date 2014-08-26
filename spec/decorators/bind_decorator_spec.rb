require 'spec_helper'

describe AngularSprinkles::Decorators::Bind do
  class StubObject
    attr_reader :some_attr

    def initialize(some_attr)
      @some_attr = some_attr
    end
  end

  class StubContext
    include AngularSprinkles::Mixins::Cache

    def bind(*args)
    end

    def set_prototype_variable(*args)
    end

    def content_for(*args)
    end
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
        expect(context).to receive(:bind).with(key, nil)
        subject.bind
      end

      it 'creates additional bindings' do
        expect(context).to receive(:bind).with(key, :some_attr)
        subject.bind(:some_attr)
      end

    end
  end

end
