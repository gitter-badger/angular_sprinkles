require "rails_helper"

feature "javascript_bindings", js: true do
  let(:name) { 'name' }
  let(:new_name) { 'namenamename?' }

  before do
    visit javascript_bindings_path(name: name)
  end

  it "should test all the things" do
    # these elements start with the @model binding
    expect(find("#data-binding-div")).to have_content(name)
    expect(find("#bind-service-div")).to have_content("Hello #{name}")
    expect(find("#directive-div h1 h2")).to have_content(name)

    # this element starts out empty
    expect { find("#bind-div") }.to raise_error

    fill_in("Input", with: new_name)
    expect(find("#data-binding-div")).to have_content(new_name)
    expect(find("#bind-service-div")).to have_content("Hello #{new_name}")
    expect(find("#directive-div h1 h2")).to have_content(new_name)

    fill_in("Bind", with: new_name)
    expect(find("#bind-div")).to have_content(new_name)

    # directive controller results
    expect(find("#directive-ctrl-bind")).to have_content("bigHelloWorldCtrlAttribute")
    expect(find("#directive-ctrl-call")).to have_content(42)
  end
end
