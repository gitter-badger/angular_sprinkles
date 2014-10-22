module AngularSprinkles
  module Element
    class Input
      def initialize(args)
        @args = (args || {})
      end

      def attributes
        { data: to_json_hash }
      end

      private

      def to_json_hash
        Hash[@args.map do |k, v|
          [k.to_s.underscore.dasherize, v.is_a?(String) ? v : v.to_json]
        end]
      end
    end
  end
end
