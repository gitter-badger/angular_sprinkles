require 'rails_helper'

describe TestController do
  render_views

  let(:name) { "name" }

  subject { get :new, { name: name }}

  it "renders the view with the correct bindings" do
    model_name = "TestModel_1"
    attr_binding = "#{model_name}.name"

    model_match = subject.body.scan(model_name)
    attr_match = subject.body.scan(attr_binding)

    expect(model_match.count).to eq(5)
    expect(attr_match.count).to eq(4)
  end
end
