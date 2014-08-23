require 'spec_helper'

describe AngularSprinkles::Controller do
  class StubController
    include AngularSprinkles::Controller
  end

  let(:controller) { StubController.new }

  describe '#add_to_constructor' do
    let(:key) { 'key' }
    let(:value) { 'value' }
    context 'when given a hash' do
      # TODO: Fix me
      # context 'and it is not empty' do
      #   let(:params) { { key => value } }

      #   it 'preloads the input data' do
      #     result = [
      #       %{#{AngularSprinkles::CONTROLLER_FN}.prototype.#{key} = #{AngularSprinkles::CONTROLLER_FN}.prototype.#{key} || "#{value}"}
      #     ]

      #     expect(controller.add_to_constructor(params)).to eq(result)
      #   end
      # end

      context 'and it is an empty hash' do
        let(:params) { {} }

        it 'returns nothing' do
          expect(controller.add_to_constructor(params)).to eq([])
        end
      end
    end

    context 'when given anything else' do
      let(:params) { value }

      it 'raises an exception' do
        expect { controller.add_to_constructor(params) }.to raise_error(TypeError)
      end
    end
  end

  describe '#bindable' do
    before do
      expect(controller).to receive(:add_to_constructor)
    end

    it 'returns a decorated object that responds to #bind' do
      object = controller.bindable(Object.new)

      expect(object.respond_to?(:bind)).to eq(true)
      expect(object.class).to eq(AngularSprinkles::Decorators::Bind)
    end
  end

  # removed for now
  # describe '#bindable_collection' do
  #   let(:times) { 5 }

  #   before do
  #     expect(controller).to receive(:add_to_constructor).once
  #   end

  #   it 'returns a collection of objects that respond to #bind' do
  #     collection = (1..times).map { Object.new }
  #     objects = controller.bindable_collection(collection)

  #     expect(objects.all? { |o| o.respond_to?(:bind) }).to eq(true)
  #     expect(objects.all? { |o| o.class == AngularSprinkles::Decorators::Bind }).to eq(true)
  #   end
  # end
end
