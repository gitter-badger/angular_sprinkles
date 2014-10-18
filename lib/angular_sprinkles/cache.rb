module AngularSprinkles
  class Cache
    def initialize
      @store = {}
    end

    def set(content)
      @store[content.to_s] = true
    end

    def set?(content)
      @store.has_key?(content.to_s)
    end
  end
end
