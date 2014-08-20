require 'spec_helper'

describe AngularSprinkles::Controller do
  class StubController
    include AngularSprinkles::Controller

    def initialize(params)
      @params = params
    end

    def index
      assignable(@params)
    end
  end

  let(:key) { 'key' }
  let(:value) { 'value' }
  let(:controller) { StubController.new(params) }

  context 'when given a hash' do
    context 'and it is not empty' do
      let(:params) { { key => value } }

      it 'preloads the input data' do
        result = [
          AngularSprinkles::CONSTRUCTOR_DEFINITION,
          %{#{AngularSprinkles::CONTROLLER_FN}.prototype.#{key} = #{AngularSprinkles::CONTROLLER_FN}.prototype.#{key} || "#{value}"}
        ]

        expect(controller.index).to eq(result)
      end
    end

    context 'and it is an empty hash' do
      let(:params) { {} }

      it 'only returns the prototype definition' do
        result = [AngularSprinkles::CONSTRUCTOR_DEFINITION]
        expect(controller.index).to eq(result)
      end
    end
  end

  context 'when given anything else' do
    let(:params) { value }

    it 'raises an exception' do
      expect { controller.index }.to raise_error(TypeError)
    end
  end

end
