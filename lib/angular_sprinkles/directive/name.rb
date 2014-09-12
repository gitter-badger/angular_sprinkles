module AngularSprinkles
  module Directive
    class Name
      def initialize(*names)
        @names = names.flatten
      end

      def attributes
        { data: to_empty_hash }
      end

      private

      def to_empty_hash
        Hash[@names.product([''])]
      end
    end
  end
end
