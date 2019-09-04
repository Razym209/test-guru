module BadgeGrant
  module RuleCreator
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      private

      def add_rule(params)
        return if params[:name].nil?
        return if self.class.instance_methods.include?(method_name(params))
        if templated_strategies.include?(params[:strategy])
          send "templated_strategy_#{params[:strategy]}", params
        end

        send 'add_event', { event: params[:event],
                            rule: method_name(params) } unless params[:event].nil?
      end

    end
  end
end
