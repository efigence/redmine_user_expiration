require_dependency 'user'

module RedmineUserExpiration
  class Cleaner

    def self.lock_expired_users
      User.status(User::STATUS_ACTIVE)
        .where("expiration_date IS NOT NULL AND expiration_date <= ?", Time.now.utc)
        .find_each do |u|
          u.lock!
      end
    end

  end
end
