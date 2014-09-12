module AngularSprinkles
  class ModelDecorator < SimpleDelegator
    def initialize(args)
      @key = args.fetch(:key)
      @json_wrapper = args.fetch(:json_wrapper)
      @object_wrapper = args.fetch(:object_wrapper)

      object = args.fetch(:object)
      super(object)
    end

    def bind(attribute = nil)
      @object_wrapper.new(@key, attribute, @json_wrapper)
    end
  end
end
