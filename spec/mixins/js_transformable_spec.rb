require 'spec_helper'

describe AngularSprinkles::Mixins::JsTransformable do
  class StubClass
    include AngularSprinkles::Mixins::JsTransformable
  end

  let(:stub_class) { StubClass.new }

  describe "#to_ctrl_variable" do
    it 'returns a javascript variable string' do
      str = 'brewhouse'

      expect(stub_class.to_ctrl_variable(str)).
        to(eq("#{AngularSprinkles::CONTROLLER_NAME}.#{str}"))
    end
  end

  describe "#set_prototype_variable" do
    it 'returns a javascript variable string with a preset value' do
      key, value = 'brewhouse', 'software'

      expect(stub_class.set_prototype_variable(key, value)).
        to(eq("#{AngularSprinkles::CONTROLLER_FN}.prototype.#{key} = #{AngularSprinkles::CONTROLLER_FN}.prototype.#{key} || #{value.to_json}"))
    end
  end

  # these methods moved to private

  # describe "#to_ctrl_prototype_variable" do
  #   it 'returns a javascript prototype variable string' do
  #     str = 'brewhouse'

  #     expect(stub_class.to_ctrl_prototype_variable(str)).
  #       to(eq("#{AngularSprinkles::CONTROLLER_FN}.prototype.#{str}"))
  #   end
  # end

  # describe "#or_equals_js" do
  #   it 'returns a javascript variable string' do
  #     expect(stub_class.or_equals_js('brewhouse', 'bacon')).
  #       to(eq('brewhouse = brewhouse || "bacon"'))
  #   end
  # end
end
