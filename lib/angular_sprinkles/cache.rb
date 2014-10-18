module AngularSprinkles
  class Cache
    def initialize
      @store = {}
    end

    def get(key)
      @store[key]
    end

    def set(key, content = true)
      @store[key] = content
    end

    def set?(key)
      @store.has_key?(key)
    end
  end
end
