module AngularSprinkles
  class Context
    attr_reader :key_generator, :constructor, :constructor_collection
    attr_accessor :content_yielder

    def initialize(args)
      @key_generator = args.fetch(:key_generator)
      @constructor = args.fetch(:constructor)
      @constructor_collection = args.fetch(:constructor_collection)
      @content_yielder = args.fetch(:content_yielder, nil)
    end
  end
end
