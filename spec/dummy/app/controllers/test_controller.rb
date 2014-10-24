class TestController < ApplicationController
  before_filter :set_model

  def javascript_bindings; end
  def form_helpers; end

  def form_for_helper
    @models = ng_bindable([@model])
  end

  def set_model
    @model = ng_bindable(TestModel.new(name: params[:name]))
  end
end
