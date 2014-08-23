require 'spec_helper'

describe AngularSprinkles::Controller do
  class StubController
    include AngularSprinkles::Controller
  end

  let(:controller) { StubController.new }

  describe '#assignable' do
    let(:key) { 'key' }
    let(:value) { 'value' }
    context 'when given a hash' do
      context 'and it is not empty' do
        let(:params) { { key => value } }

        it 'preloads the input data' do
          result = [
            %{#{AngularSprinkles::CONTROLLER_FN}.prototype.#{key} = #{AngularSprinkles::CONTROLLER_FN}.prototype.#{key} || "#{value}"}
          ]

          expect(controller.assignable(params)).to eq(result)
        end
      end

      context 'and it is an empty hash' do
        let(:params) { {} }

        it 'returns nothing' do
          expect(controller.assignable(params)).to eq([])
        end
      end
    end

    context 'when given anything else' do
      let(:params) { value }

      it 'raises an exception' do
        expect { controller.assignable(params) }.to raise_error(TypeError)
      end
    end
  end

  describe '#bindable' do
    before do
      expect(controller).to receive(:assignable)
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
  #     expect(controller).to receive(:assignable).once
  #   end

  #   it 'returns a collection of objects that respond to #bind' do
  #     collection = (1..times).map { Object.new }
  #     objects = controller.bindable_collection(collection)

  #     expect(objects.all? { |o| o.respond_to?(:bind) }).to eq(true)
  #     expect(objects.all? { |o| o.class == AngularSprinkles::Decorators::Bind }).to eq(true)
  #   end
  # end
end
