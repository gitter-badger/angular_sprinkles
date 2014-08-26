module AngularSprinkles
  class VariableCache
    def initialize
      @cache = {}
    end

    def yield_if_new(var)
      var = var.split('.') if var.is_a?(String)
      var = [var].flatten.compact.map(&:to_sym)

      unless @cache[var]
        yield(var.join('.')) if block_given?
        @cache[var] = true
      else
        false
      end
    end
  end
end
