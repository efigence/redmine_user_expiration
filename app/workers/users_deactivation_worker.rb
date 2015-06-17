require_dependency 'user'

class UsersDeactivationWorker
  include Sidekiq::Worker

  def perform
    UserExpiration::Cleaner.execute
  end

end
