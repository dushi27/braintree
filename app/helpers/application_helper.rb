module ApplicationHelper
  module BootstrapExtension # Override the 'text_field_tag' method defined in FormTagHelper[1]
    FORM_CONTROL_CLASS = "form-control"
    
    def text_field_tag(name, value = nil, options = {})
      class_name = options[:class]
      if class_name.nil?
        options[:class] = FORM_CONTROL_CLASS
      else
        options[:class] << " #{FORM_CONTROL_CLASS}" if
          " #{class_name} ".index(" #{FORM_CONTROL_CLASS} ").nil?
      end
      super
    end
  end

  include BootstrapExtension
end
