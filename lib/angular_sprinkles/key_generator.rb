module AngularSprinkles
  class KeyGenerator
    def initialize(args)
      @counter = args.fetch(:counter)
      @cache = args.fetch(:cache)
    end

    def call(object)
      return @cache.get(object) if @cache.set?(object)

      klass = "#{object.class}".gsub("::", "__")
      count = @counter.inc(klass)
      generated_key = "#{klass}_#{count}"

      @cache.set(object, generated_key)

      generated_key
    end
  end
end
