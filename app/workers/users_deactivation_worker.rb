module RedmineUserExpiration
  class UsersDeactivationWorker
    include Sidekiq::Worker

    def perform
      RedmineUserExpiration::Cleaner.lock_expired_users
    end

  end
end
