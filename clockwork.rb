#### PLACE IT IN REDMINE ROOT DIRECTORY ####

require "clockwork"

module Clockwork
  every(1.day, 'expired_users_deactivation.perform', :at => '03:00') do
    RedmineUserExpiration::UsersDeactivationWorker.perform_async
  end
end
