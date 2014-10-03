class TestController < ApplicationController
  before_filter :set_model

  def javascript_bindings; end
  def form_helpers; end

  def set_model
    @model = bindable(TestModel.new(name: params[:name]))
  end
end
