module AngularSprinkles
  module Directive
    class Input
      def initialize(args)
        @args = (args || {}).symbolize_keys
      end

      def attributes
        { data: to_json_hash }
      end

      private

      def to_json_hash
        Hash[@args.map do |k, v|
          [k, v.is_a?(String) ? v : v.to_json]
        end]
      end
    end
  end
end
