module AngularSprinkles
  class FormBinder
    def self.new(args)
      helper = args.fetch(:helper)

      case helper
      when :check_box
        CheckBox.new(args)
      else
        Default.new(args)
      end
    end
  end
end
