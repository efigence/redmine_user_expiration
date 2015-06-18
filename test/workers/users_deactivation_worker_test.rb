require File.expand_path('../../test_helper', __FILE__)
require File.expand_path('../../../app/workers/users_deactivation_worker', __FILE__)
require 'sidekiq/testing'

class UsersDeactivationWorkerTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    User.current = nil
  end

  def test_user_deactivation_worker_should_initiate_cleaner
    user1 = users(:users_001)
    user2 = users(:users_002)
    user3 = users(:users_003)

    assert_difference 'User.status(User::STATUS_ACTIVE).count', -1 do
      UserExpiration::UsersDeactivationWorker.perform_async
      UserExpiration::UsersDeactivationWorker.drain
    end
  end

end
