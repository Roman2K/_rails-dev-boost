module RailsDevelopmentBoost
  module ViewHelpersPatch
    def self.apply!
      patch = self
      ['ActionController', 'ActionMailer'].each do |name|
        if mod = eval("#{name} if defined? #{name}", TOPLEVEL_BINDING)
          mod::Helpers::ClassMethods.module_eval { include patch }
        end
      end
    end
    
    # Explicitly associate helpers to their including controllers/mailers.
    def add_template_helper_with_const_association_tracking(helper_module)
      ActiveSupport::Dependencies.add_explicit_dependency(helper_module, self)
      add_template_helper_without_const_association_tracking(helper_module)
    end

    def self.included(target)
      target.alias_method_chain :add_template_helper, 'const_association_tracking'
    end
  end
end
