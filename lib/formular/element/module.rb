# Include this in every module that gets further included.
# This is literally a copy and past from reform. Could we dry this up ??
# https://github.com/apotonick/reform/blob/master/lib/reform/form/module.rb
require 'declarative'
require 'declarative/heritage'
module Formular
  class Element
    module Module
      # DISCUSS: could this be part of Declarative?
      def self.included(base)
        base.extend ClassMethods
        base.extend Declarative::Heritage::DSL # ::heritage
        # base.extend Declarative::Heritage::Included # ::included
        base.extend Included
      end

      module Included
        # Gets imported into your module and will be run when including it.
        def included(includer)
          super
          # first, replay all declaratives like ::property on includer.
          heritage.(includer) # this normally happens via Heritage::Included.
          # then, include optional accessors.
          includer.send(:include, self::InstanceMethods) if const_defined?(:InstanceMethods)
        end
      end # module Included

      module ClassMethods
        def method_missing(method, ...)
          heritage.record(method, ...)
        end
      end # module ClassMethods
    end # module Module
  end # class Element
end # module Formular
