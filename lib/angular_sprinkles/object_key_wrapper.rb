module AngularSprinkles
  class ObjectKeyWrapper
    def initialize(*args)
      *@args, @json_wrapper = args
    end

    def to_json
      @json_wrapper.call(*@args)
    end
    alias :to_s :to_json
  end
end
