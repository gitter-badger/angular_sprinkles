module AngularSprinkles
  module Element
    class Attributes
      def initialize(args, options)
        @args = args
        @content = options.fetch(:content, '')
        @tag = options[:tag] || :div
      end

      def to_content_tag
        attrs = @args.map(&:attributes).inject(&:deep_merge)
        [@tag, @content, attrs]
      end
    end
  end
end
