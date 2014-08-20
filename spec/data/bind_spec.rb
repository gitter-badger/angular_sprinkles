require 'spec_helper'

describe AngularSprinkles::Data::Bind do
  let(:keys) { [:brewhouse, :software] }
  let(:object) { AngularSprinkles::Data::Bind.new(*keys) }

  it 'returns the concatenation of the two keys' do
    expect(object.to_json).to eq("#{AngularSprinkles::CONTROLLER_NAME}.#{keys.join('.')}")
    expect(object.to_s).to eq("#{AngularSprinkles::CONTROLLER_NAME}.#{keys.join('.')}")
  end
end
