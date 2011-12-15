module ShowFor
  module Label
    def label(text_or_attribute, options={}, apply_options=true)
      label = if text_or_attribute.is_a?(String)
        text_or_attribute
      elsif options.key?(:label)
        options.delete(:label)
      elsif text_or_attribute.is_a?(Symbol) and !text_or_attribute.blank?
        I18n.t( text_or_attribute.to_sym, :scope => [:show_for,@object.class.to_s.downcase.to_sym], :default => human_attribute_name(text_or_attribute) )
      else
        human_attribute_name(text_or_attribute)
      end

      return nil.to_s if label == false
      options[:label_html] = options.dup if apply_options

      label = ShowFor.label_proc.call(label) if options.fetch(:wrap_label, true) && ShowFor.label_proc
      wrap_with :label, label, options
    end

  protected

    def human_attribute_name(attribute) #:nodoc:
      @object.class.human_attribute_name(attribute.to_s)
    end
  end
end
