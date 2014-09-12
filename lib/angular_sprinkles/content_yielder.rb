module AngularSprinkles
  class ContentYielder
    def initialize(args)
      @context = args.fetch(:context)
      @yield_to = args.fetch(:yield_to)
      @cache = args.fetch(:cache)
    end

    def call(content)
      return '' if @cache.set?(content)

      @cache.set(content)

      @context.content_tag(:script, content.to_json.html_safe).tap do |script_tag|
        @context.content_for(@yield_to, script_tag)
      end
    end
  end
end
