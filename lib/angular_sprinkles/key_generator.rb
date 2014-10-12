module AngularSprinkles
  class KeyGenerator
    def initialize(args)
      @counter = args.fetch(:counter)
    end

    def call(object)
      klass = "#{object.class}".gsub("::", "__")
      count = @counter.inc(klass)

      "#{klass}_#{count}"
    end
  end
end
