module BadgeGrant
  module EventCreator
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      private

      def add_event(params)
        event = params[:event].downcase
        rule = params[:rule].downcase
        variable = :@@events
        class_variable_set(variable, {}) unless class_variable_defined?(variable)
        events = class_variable_get(variable)
        events[event] ||= { rules: [] }
        events[event][:rules] << rule unless events[event][:rules].include?(rule)
        class_variable_set(variable, events)
      end
    end
  end
end
