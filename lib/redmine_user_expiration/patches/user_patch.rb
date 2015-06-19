require_dependency 'user'

module RedmineUserExpiration
  module Patches
    module UserPatch
      def self.included(base)
        base.class_eval do
          unloadable

          safe_attributes 'expiration_date'

          # chain active? method
          alias_method :active_without_expiration_date, :active?

          def active_with_expiration_date
            active_without_expiration_date && !(expiration_date && expiration_date <= Time.now)
          end

          alias_method :active?, :active_with_expiration_date

        end
      end
    end
  end
end

unless User.included_modules.include?(RedmineUserExpiration::Patches::UserPatch)
  User.send(:include, RedmineUserExpiration::Patches::UserPatch)
end
