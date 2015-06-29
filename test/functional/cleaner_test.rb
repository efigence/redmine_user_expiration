require File.expand_path('../../test_helper', __FILE__)

class CleanerTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    User.current = nil
  end

  def test_cleaner_should_lock_account_with_past_expiration_date
    user1 = users(:users_001)
    user2 = users(:users_002)
    user3 = users(:users_003)

    assert_difference 'User.status(User::STATUS_ACTIVE).count', -1 do
      RedmineUserExpiration::Cleaner.lock_expired_users
    end

    user1.reload
    assert_equal User::STATUS_LOCKED, user1.status

  end

end
