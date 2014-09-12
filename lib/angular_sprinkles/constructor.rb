module AngularSprinkles
  class Constructor
    def initialize(args)
      @json_wrapper = args.fetch(:json_wrapper)
      @collection = args.fetch(:collection)
    end

    def to_json
      @json_wrapper.call(@collection)
    end
  end
end
