module AngularSprinkles
  class FormBinder
    def self.new(args)
      case args.fetch(:helper).to_sym
      when :check_box
        CheckBox.new(args)
      else
        Default.new(args)
      end
    end
  end
end
