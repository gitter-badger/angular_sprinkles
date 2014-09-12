module AngularSprinkles
  class Counter
    def initialize
      @klasses = {}
    end

    def inc(klass)
      @klasses[klass] ||= 0
      @klasses[klass] += 1
    end
  end
end
