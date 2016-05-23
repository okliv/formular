require "formular/elements/input"
require "formular/elements/textarea"
require "formular/elements/container"
require "formular/elements/label"
require "formular/elements/wrapped_control"
require "formular/elements/select"
module Formular
  module Elements
    module Bootstrap3
      class Error < Formular::Elements::Container
        tag :span
        attribute :class, ["help-block"]

      end #class Error

      class Input < Formular::Elements::Input
        include Formular::Elements::WrappedControl

        attribute :class, ["form-control"]

        def control_html
          Renderer.new(Proc.new {opening_tag(true)}).call(self)
        end
      end #class Input

      class Select < Formular::Elements::Select
        include Formular::Elements::WrappedControl

        attribute :class, ["form-control"]

        def control_html
          Renderer.new(Proc.new { |input| [opening_tag,input.option_tags,closing_tag].join("") }).call(self)
        end
      end #class Select

      class File < Formular::Elements::Bootstrap3::Input
        include Formular::Elements::WrappedControl

        add_option_keys [:error_options, :label_options, :wrapper_options]

        attribute :class, []
        attribute :type, "file"
      end #class File

      class Textarea < Formular::Elements::Textarea
        include Formular::Elements::WrappedControl
        attribute :class, ["form-control"]

        def control_html
          Renderer.new(Proc.new { |input| [opening_tag,input.content,closing_tag].join("") }).call(self)
        end
      end #class Textarea

      class Label < Formular::Elements::Label
        attribute :class, ["control-label"]
      end #class Label

      class Wrapper < Formular::Elements::Container
        tag "div"
        attribute :class, ["form-group"]
      end #class Wrapper

      class ErrorWrapper < Formular::Elements::Container
        tag "div"
        attribute :class, ["form-group", "has-error"]
      end #class Wrapper

      class Submit < Formular::Elements::Submit
        attribute :class, ["btn", "btn-default"]
      end #class Submit
    end #module Bootstrap3
  end #module Elements
end #module Formular
