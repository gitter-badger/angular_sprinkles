module AngularSprinkles
  class ModelDecorator < SimpleDelegator
    def initialize(args)
      @key = args.fetch(:key)
      @json_wrapper = args.fetch(:json_wrapper)
      @object_wrapper = args.fetch(:object_wrapper)
      @object = args.fetch(:object)

      super(@object)
    end

    def bind(attribute = nil)
      @object_wrapper.new(@key, attribute, @json_wrapper)
    end

    ##
    # Rails uses #class as a part of #form_for to create labels.
    # Delegate this method to the model class to prevent this issue.
    def class
      @object.class
    end
  end
end
