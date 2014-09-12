module AngularSprinkles
  class ConstructorCollection
    def initialize(args)
      @json_wrapper = args.fetch(:json_wrapper)
      @object_wrapper = args.fetch(:object_wrapper)
      @collection = []
    end

    def push(object, key)
      bundle = @object_wrapper.new(object, key, @json_wrapper)

      @collection.push(bundle)
    end

    def to_json
      @collection.map!(&:to_json).join("\n")
    end
    alias :to_s :to_json
  end
end
