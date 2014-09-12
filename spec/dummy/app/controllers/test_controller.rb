class TestController < ApplicationController
  def new
    @model = bindable(TestModel.new(name: params[:name]))
  end
end
