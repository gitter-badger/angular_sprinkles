require 'spec_helper'

describe AngularSprinkles::Helpers::BindHelper do
  class StubClass
    include AngularSprinkles::Helpers::BindHelper
  end

  let(:stub) { StubClass.new }

  describe '#bind' do
    before { allow(stub).to receive(:content_for).and_return(true) }

    context 'when 0 arguments' do
      it 'raises an argument error' do
        expect { stub.bind }.to raise_error(ArgumentError)
      end
    end

    context 'when 1 argument' do
      let(:var) { :brewhouse }

      it 'returns the variable name given as a js string' do
        expect(stub.bind(var).to_json).
          to(eq("#{AngularSprinkles::CONTROLLER_NAME}.#{var}"))
      end
    end

    context 'when 2 arguments' do
      let(:vars) { [:brewhouse, :software] }

      it 'returns the variables chained together as a js string' do
        expect(stub.bind(*vars).to_json).
          to(eq("#{AngularSprinkles::CONTROLLER_NAME}.#{vars.join('.')}"))
      end

      it 'yields the contructor definition and the first variable to the function to prototype' do
        expect(stub).to receive(:yield_to_sprinkles).
          with("#{AngularSprinkles::CONTROLLER_FN}.prototype.#{vars.first} = #{AngularSprinkles::CONTROLLER_FN}.prototype.#{vars.first} || {};")

        stub.bind(*vars)
      end
    end

    context 'when 3 arguments' do
      let(:vars) { [:brewhouse, :software, :is_neat] }

      it 'returns the variables chained together as a js string' do
        expect(stub.bind(*vars).to_json).
          to(eq("#{AngularSprinkles::CONTROLLER_NAME}.#{vars.join('.')}"))
      end

      it 'yields the constructor definition and the first variable to the function to prototype' do
        expect(stub).to receive(:yield_to_sprinkles).
          with(%{#{AngularSprinkles::CONTROLLER_FN}.prototype.#{vars.first} = #{AngularSprinkles::CONTROLLER_FN}.prototype.#{vars.first} || {};
#{AngularSprinkles::CONTROLLER_FN}.prototype.#{vars.first(2).join('.')} = #{AngularSprinkles::CONTROLLER_FN}.prototype.#{vars.first(2).join('.')} || {};})

        stub.bind(*vars)
      end
    end

    context 'when bind is called more than once' do
      let(:vars) { [:brewhouse, :software, :is_neat] }

      context 'and it is with the same variables' do
        it 'yields the constructor definition and the first variable to the function to prototype' do
          expect(stub).to receive(:content_for).once
          5.times { stub.bind(*vars) }
        end
      end

      context 'and it is called with different sets of variables' do
        it 'yields the constructor definition, first variable, and a chain of the first two variables' do
          expect(stub).to receive(:content_for).exactly(2).times

          stub.bind(vars.first) # yields the constructor
          stub.bind(vars.first) # yields nothing
          stub.bind(*vars.first(2)) # yields declaration for :brewhouse
          stub.bind(*vars) # yields declaration for [:brewhouse, :software]
          stub.bind(*vars) # yields nothing
        end
      end
    end

    context 'when the constructor has already been yielded' do
      let(:var) { :brewhouse }

      it 'does not yield anything with only one argument' do
        expect(stub).not_to receive(:content_for)
        stub.bind(var)
      end
    end
  end
end
