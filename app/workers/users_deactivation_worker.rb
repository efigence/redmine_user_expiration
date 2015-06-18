module UserExpiration
  class UsersDeactivationWorker
    include Sidekiq::Worker

    def perform
      UserExpiration::Cleaner.lock_expired_users
    end

  end
end
