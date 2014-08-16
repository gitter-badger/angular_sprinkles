require 'spec_helper'

describe AngularSprinkles::Helpers::DirectiveHelper do
  class StubClass
    include AngularSprinkles::Helpers::DirectiveHelper
  end

  let(:stub) { StubClass.new }
  let(:var) { 'brewhouse' }
  let(:var2) { 'software' }
  let(:var_binded) { AngularSprinkles::Data::Bind.new(var) }
  let(:var2_binded) { AngularSprinkles::Data::Bind.new(var2) }

  it 'renders a tag' do
    html = stub.directive(:blink)

    expect(html).to eq('<div data-blink=""></div>')
  end

  it 'renders a tag for multiple directives' do
    html = stub.directive([:blink, :block])

    expect(html).to eq('<div data-blink="" data-block=""></div>')
  end

  it 'renders a tag with initial values' do
    html = stub.directive(:blink, { input: 42 })

    expect(html).to eq('<div data-blink="" data-input="42"></div>')
  end

  it 'renders a tag with a binding as the initial value' do
    html = stub.directive(:blink, { input: var_binded, some_other_input: [1,2,3] })

    expect(html).
      to eq(%{<div data-blink="" data-input="#{AngularSprinkles::CONTROLLER_NAME}.#{var}" data-some-other-input="[1,2,3]"></div>})
  end

  it 'renders a tag with a nested binding as the initial value' do
    html = stub.directive(:blink, { input: var2_binded })

    expect(html).
      to eq(%{<div data-blink="" data-input="#{AngularSprinkles::CONTROLLER_NAME}.#{var2}"></div>})
  end

  it 'renders a tag with class and style' do
    klass = 'brewhouse'
    style = 'color:red;'

    html = stub.directive(:blink, {}, { class: klass, style: style })

    expect(html).to eq(%{<div class="#{klass}" data-blink="" style="#{style}"></div>})
  end

  it 'raises an exception if the name is not a string, symbol, or array' do
    expect { stub.directive(Object.new) }.to raise_error(TypeError)
    expect { stub.directive(1) }.to raise_error(TypeError)
    expect { stub.directive({}) }.to raise_error(TypeError)
  end

  it 'raises an exception if the input and options are not hashes' do
    expect { stub.directive(:blink, 1) }.to raise_error(TypeError)
    expect { stub.directive(:blink, {}, :brewhouse) }.to raise_error(TypeError)
  end

end
