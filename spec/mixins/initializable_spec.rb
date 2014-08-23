require 'spec_helper'

describe AngularSprinkles::Mixins::Initializable do
  class StubClass
    include AngularSprinkles::Mixins::Initializable
  end

  let(:stub_class) { StubClass.new }

  describe '#var_initialized?' do
    it 'returns false the first time and true after that' do
      var = 'a.b'

      expect(stub_class.var_initialized?(var)).to eq(false)
      expect(stub_class.var_initialized?(var)).to eq(true)
      expect(stub_class.var_initialized?(var)).to eq(true)

      expect(stub_class.var_initialized?(var + '.c')).to eq(false)
      expect(stub_class.var_initialized?(var + '.c')).to eq(true)
    end
  end

end
